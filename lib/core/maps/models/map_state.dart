import 'package:flutter/material.dart';

class MapState {
  final Offset passengerPosition;
  final Offset driverPosition;
  final Offset pickupPosition;
  final Offset destinationPosition;

  const MapState({
    required this.passengerPosition,
    required this.driverPosition,
    required this.pickupPosition,
    required this.destinationPosition,
  });

  MapState copyWith({
    Offset? passengerPosition,
    Offset? driverPosition,
    Offset? pickupPosition,
    Offset? destinationPosition,
  }) {
    return MapState(
      passengerPosition:
          passengerPosition ?? this.passengerPosition,
      driverPosition:
          driverPosition ?? this.driverPosition,
      pickupPosition:
          pickupPosition ?? this.pickupPosition,
      destinationPosition:
          destinationPosition ?? this.destinationPosition,
    );
  }
}