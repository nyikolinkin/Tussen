import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

import '../models/map_driver.dart';
import '../models/map_state.dart';
import '../models/driver_status.dart';

class MapStateNotifier extends StateNotifier<MapState> {
  MapStateNotifier()
      : super(
          MapState(
            passengerPosition: const Offset(180, 280),

            drivers: const [
  MapDriver(
    id: 'driver_1',
    position: Offset(60, 60),
    rating: 4.9,
  ),

  MapDriver(
    id: 'driver_2',
    position: Offset(320, 70),
    rating: 4.6,
  ),

  MapDriver(
    id: 'driver_3',
    position: Offset(80, 320),
    rating: 4.3,
  ),
],

            pickupPosition: const Offset(180, 220),
            destinationPosition: const Offset(300, 100),
          ),
        );


  // ======================================================
  // TEMPORARY getter
  // Keep compatibility with older code.
  // ======================================================
  Offset get driverPosition => state.drivers.first.position;

  Offset get pickupPosition => state.pickupPosition;


  // ======================================================
  // Finds nearest available driver.
  // ======================================================
  MapDriver findNearestAvailableDriver() {
    final passenger = state.passengerPosition;

    MapDriver? nearestDriver;
    double nearestDistance = double.infinity;

    for (final driver in state.drivers) {
      if (!driver.available) continue;

      final dx = driver.position.dx - passenger.dx;
      final dy = driver.position.dy - passenger.dy;

      final distance = sqrt(dx * dx + dy * dy);

      if (distance < nearestDistance) {
        nearestDistance = distance;
        nearestDriver = driver;
      }
    }

    return nearestDriver!;
  }

  List<MapDriver> findNearestAvailableDrivers({
  int limit = 3,
}) {
  final passenger = state.passengerPosition;

  // Only drivers that are available
  final availableDrivers = state.drivers
      .where((driver) => driver.available)
      .toList();

  // Sort by distance to the passenger
  availableDrivers.sort((a, b) {
    final distanceA = sqrt(
      pow(a.position.dx - passenger.dx, 2) +
      pow(a.position.dy - passenger.dy, 2),
    );
    for (final driver in availableDrivers) {
  print(
    "${driver.id} : ${driver.position}",
  );
}

    final distanceB = sqrt(
      pow(b.position.dx - passenger.dx, 2) +
      pow(b.position.dy - passenger.dy, 2),
    );

    return distanceA.compareTo(distanceB);
  });

  // Return only the closest drivers
  return availableDrivers.take(limit).toList();
}


  // ======================================================
  // NEW
  //
  // Gets the LIVE driver position from state.
  //
  // Important:
  // Do not use the old assigned driver object because
  // it contains the original position.
  // ======================================================
  MapDriver getDriverById(String driverId) {
    return state.drivers.firstWhere(
      (driver) => driver.id == driverId,
    );
  }


  // ======================================================
  // Move ONE specific driver.
  // ======================================================
  void moveDriver(
    String driverId,
    Offset position,
  ) {
    final updatedDrivers = state.drivers.map((driver) {
      if (driver.id == driverId) {
        return driver.copyWith(
          position: position,
        );
      }

      return driver;
    }).toList();

    state = state.copyWith(
      drivers: updatedDrivers,
    );
  }


  void movePassenger(Offset position) {
    state = state.copyWith(
      passengerPosition: position,
    );
  }


  void setDestination(Offset position) {
    state = state.copyWith(
      destinationPosition: position,
    );
  }

  // ======================================================
// Updates the status of ONE specific driver.
//
// Examples:
//
// available
// assigned
// arriving
// waiting
// onTrip
// offline
// ======================================================
void setDriverStatus(
  String driverId,
  DriverStatus status,
) {
  final updatedDrivers = state.drivers.map((driver) {
    if (driver.id == driverId) {
      return driver.copyWith(
        status: status,
      );
    }

    return driver;
  }).toList();

  state = state.copyWith(
    drivers: updatedDrivers,
  );
}

  void setPickup(Offset position) {
    state = state.copyWith(
      pickupPosition: position,
    );
  }

  
}


final mapStateProvider =
    StateNotifierProvider<MapStateNotifier, MapState>(
  (ref) => MapStateNotifier(),
);