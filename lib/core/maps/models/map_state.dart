import 'package:flutter/material.dart';

import 'map_driver.dart'; // <-- NEW

class MapState {
  final Offset passengerPosition;

  // ==========================================================
  // CHANGED
  //
  // Was:
  // final Offset driverPosition;
  //
  // Now we support multiple drivers.
  // ==========================================================
  final List<MapDriver> drivers;

  final Offset pickupPosition;
  final Offset destinationPosition;

  const MapState({
    required this.passengerPosition,

    // CHANGED
    required this.drivers,

    required this.pickupPosition,
    required this.destinationPosition,
  });

  MapState copyWith({
    Offset? passengerPosition,

    // CHANGED
    List<MapDriver>? drivers,

    Offset? pickupPosition,
    Offset? destinationPosition,
  }) {
    return MapState(
      passengerPosition:
          passengerPosition ?? this.passengerPosition,

      // CHANGED
      drivers: drivers ?? this.drivers,

      pickupPosition:
          pickupPosition ?? this.pickupPosition,

      destinationPosition:
          destinationPosition ?? this.destinationPosition,
    );
  }
}