import 'package:flutter/material.dart';

import '../../../core/maps/providers/map_state_provider.dart';
import '../../../core/maps/services/map_simulator.dart';

import '../domain/models/ride_stage.dart';
import '../infrastructure/ride_simulator.dart';
import '../providers/ride_state_provider.dart';

class RideController {
  final MapStateNotifier mapNotifier;
  final RideStateNotifier rideNotifier;

  late final RideSimulator _rideSimulator;
  MapSimulator? _mapSimulator;

  RideController({
    required this.rideNotifier,
    required this.mapNotifier,
  }) {
    _rideSimulator = RideSimulator(
      onStageChanged: _handleRideStage,
    );
  }

  // ==========================================================
  // Called ONLY by RideSimulator.
  //
  // RideSimulator now only simulates:
  // Searching -> Driver Found
  //
  // It no longer starts the taxi.
  // ==========================================================
  void _handleRideStage(RideStage stage) {
    rideNotifier.setStage(stage);
  }

  // ==========================================================
  // Generic journey engine.
  //
  // It doesn't care whether it is:
  // - Driver -> Pickup
  // - Pickup -> Destination
  // - Parcel Delivery
  // - Food Delivery
  //
  // It simply moves from A to B.
  // ==========================================================
  void _startJourney({
  required Offset start,
  required Offset destination,
  required RideStage startedStage,
  required RideStage completedStage,
}) {

  _mapSimulator?.stop();
  print("Starting journey");
  print("From: $start");
  print("To: $destination");

  _mapSimulator = MapSimulator(
    start: start,
    destination: destination,

    onDriverMoved: mapNotifier.moveDriver,

    onJourneyStarted: () {
      rideNotifier.setStage(startedStage);
    },

    onJourneyCompleted: () {
      rideNotifier.setStage(completedStage);
    },
  );

  _mapSimulator!.startSimulation();
}

  // ==========================================================
  // Starts searching for a driver.
  // ==========================================================
  void requestRide() {
    _rideSimulator.start();
  }

  // ==========================================================
  // Passenger confirms the driver.
  //
  // (In production this will eventually happen after the
  // driver accepts via the Driver App.)
  // ==========================================================
  Future<void> acceptRide() async {
    rideNotifier.setStage(RideStage.waitingForDriver);

    await Future.delayed(const Duration(seconds: 2));

    rideNotifier.setStage(RideStage.accepted);

    // -------------------------------
    // JOURNEY 1
    // Driver -> Pickup
    // -------------------------------
    _startJourney(
  start: mapNotifier.state.driverPosition,
  destination: mapNotifier.state.pickupPosition,
  startedStage: RideStage.driverArriving,
  completedStage: RideStage.driverArrived,
);
  }

  // ==========================================================
  // Passenger is now inside the vehicle.
  //
  // (Later the Driver App will trigger this.)
  // ==========================================================
  Future<void> startTrip() async {
  print("========== START TRIP ==========");

  rideNotifier.setStage(RideStage.tripStarted);
  print("Stage -> Trip Started");

  _startJourney(
    start: mapNotifier.state.driverPosition,
    destination: mapNotifier.state.destinationPosition,
    startedStage: RideStage.tripInProgress,
    completedStage: RideStage.tripCompleted,
  );

  print("Journey started");
}

  // ==========================================================
  // Cancels everything.
  // ==========================================================
  void cancelRide() {
    _rideSimulator.stop();
    _mapSimulator?.stop();

    rideNotifier.setStage(RideStage.cancelled);
  }
}