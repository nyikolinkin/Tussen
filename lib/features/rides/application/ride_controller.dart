import 'package:flutter/material.dart';

import '../../../core/maps/models/driver_status.dart';
import '../../../core/maps/models/map_driver.dart';
import '../../../core/maps/providers/map_state_provider.dart';
import '../../../core/maps/services/map_simulator.dart';

import '../application/dispatch_service.dart';
import '../data/repositories/driver_repository.dart';
import '../domain/models/ride_stage.dart';
import '../infrastructure/ride_simulator.dart';
import '../providers/ride_state_provider.dart';
import '../../../core/maps/constants/map_constants.dart';

class RideController {
  final MapStateNotifier mapNotifier;
  final RideStateNotifier rideNotifier;
  final DriverRepository driverRepository;

  final DispatchService _dispatchService = DispatchService();

  late final RideSimulator _rideSimulator;
  MapSimulator? _mapSimulator;

  MapDriver? _assignedDriver;

  RideController({
    required this.rideNotifier,
    required this.mapNotifier,
    required this.driverRepository,
  }) {
    _rideSimulator = RideSimulator();
  }

  // ==========================================================
  // Generic journey engine
  // ==========================================================
  void _startJourney({
    required Offset start,
    required Offset destination,
    required RideStage startedStage,
    required RideStage completedStage,
    required DriverStatus startedStatus,
    required DriverStatus completedStatus,
  }) {
    _mapSimulator?.stop();

    print("================================");
    print("Starting journey");
    print("Driver : ${rideNotifier.currentDriver?.name}");
    print("Taxi   : ${_assignedDriver?.id}");
    print("From   : $start");
    print("To     : $destination");
    print("================================");

    _mapSimulator = MapSimulator(
      driverId: _assignedDriver!.id,
      start: start,
      destination: destination,

      onDriverMoved: mapNotifier.moveDriver,

      // NEW
      onDistanceChanged: (distanceInUnits) {
  // Convert map units to meters.
  final distanceMeters =
      distanceInUnits * MapConstants.metersPerUnit;

  // Calculate ETA using average vehicle speed.
  final etaSeconds =
      (distanceMeters /
              MapConstants.averageSpeedMetersPerSecond)
          .ceil();

  rideNotifier.updateEta(
    remainingDistance: distanceMeters,
    etaSeconds: etaSeconds,
  );
},

      onJourneyStarted: () {
        rideNotifier.setStage(startedStage);

        mapNotifier.setDriverStatus(
          _assignedDriver!.id,
          startedStatus,
        );
      },

      onJourneyCompleted: () {
        rideNotifier.setStage(completedStage);

        mapNotifier.setDriverStatus(
          _assignedDriver!.id,
          completedStatus,
        );

        if (completedStage == RideStage.tripCompleted) {
          rideNotifier.clearDriver();

          rideNotifier.updateEta(
            remainingDistance: 0,
            etaSeconds: 0,
          );

          _assignedDriver = null;
        }
      },
    );

    _mapSimulator!.startSimulation();
  }

  // ==========================================================
  // Passenger requests a ride
  // ==========================================================
  void requestRide() {
    rideNotifier.setStage(RideStage.searching);

    _rideSimulator.start(
      onFinished: acceptRide,
    );
  }

  // ==========================================================
  // Driver dispatch
  // ==========================================================
  Future<void> acceptRide() async {
    final candidates =
        mapNotifier.findNearestAvailableDrivers();

    _assignedDriver =
    await _dispatchService.dispatchRide(
      candidates: candidates,
      driverRepository: driverRepository,
    );

    if (_assignedDriver == null) {
      print("No driver accepted the request.");

      rideNotifier.setStage(
        RideStage.noDriverFound,
      );

      return;
    }

    final driver = driverRepository.getById(
      _assignedDriver!.id,
    );

    // Store driver FIRST
    rideNotifier.setDriver(driver);

    // THEN notify the UI
    rideNotifier.setStage(
      RideStage.driverFound,
    );

    mapNotifier.setDriverStatus(
      _assignedDriver!.id,
      DriverStatus.assigned,
    );
  }

  // ==========================================================
  // Passenger confirms the driver
  // ==========================================================
  Future<void> confirmDriver() async {
    if (_assignedDriver == null) return;

    rideNotifier.setStage(
      RideStage.waitingForDriver,
    );

    await Future.delayed(
      const Duration(seconds: 2),
    );

    rideNotifier.setStage(
      RideStage.accepted,
    );

    _startJourney(
      start: _assignedDriver!.position,
      destination: mapNotifier.state.pickupPosition,
      startedStage: RideStage.driverArriving,
      completedStage: RideStage.driverArrived,
      startedStatus: DriverStatus.arriving,
      completedStatus: DriverStatus.waiting,
    );
  }

  // ==========================================================
  // Passenger starts trip
  // ==========================================================
  Future<void> startTrip() async {
    if (_assignedDriver == null) return;

    final currentDriver = mapNotifier.getDriverById(
      _assignedDriver!.id,
    );

    rideNotifier.setStage(
      RideStage.tripStarted,
    );

    _startJourney(
      start: currentDriver.position,
      destination: mapNotifier.state.destinationPosition,
      startedStage: RideStage.tripInProgress,
      completedStage: RideStage.tripCompleted,
      startedStatus: DriverStatus.onTrip,
      completedStatus: DriverStatus.available,
    );
  }

  // ==========================================================
  // Cancel ride
  // ==========================================================
  void cancelRide() {
    _rideSimulator.stop();
    _mapSimulator?.stop();

    if (_assignedDriver != null) {
      mapNotifier.setDriverStatus(
        _assignedDriver!.id,
        DriverStatus.available,
      );
    }

    rideNotifier.clearDriver();

    rideNotifier.updateEta(
      remainingDistance: 0,
      etaSeconds: 0,
    );

    _assignedDriver = null;

    rideNotifier.setStage(
      RideStage.cancelled,
    );
  }
}