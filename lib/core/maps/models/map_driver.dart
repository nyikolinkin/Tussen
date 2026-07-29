import 'package:flutter/material.dart';

import 'driver_status.dart';

class MapDriver {
  final String id;
  final Offset position;
  final DriverStatus status;

  /// Live driver rating shown on the map.
  final double rating;

  const MapDriver({
    required this.id,
    required this.position,
    this.status = DriverStatus.available,
    this.rating = 4.8,
  });

  bool get available => status == DriverStatus.available;

  MapDriver copyWith({
    String? id,
    Offset? position,
    DriverStatus? status,
    double? rating,
  }) {
    return MapDriver(
      id: id ?? this.id,
      position: position ?? this.position,
      status: status ?? this.status,
      rating: rating ?? this.rating,
    );
  }
}