import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/map_state.dart';

class MapStateNotifier extends StateNotifier<MapState> {
  MapStateNotifier()
      : super(
          const MapState(
            passengerPosition: Offset(180, 280),
            driverPosition: Offset(60, 60),
            pickupPosition: Offset(180, 220),
            destinationPosition: Offset(300, 100),
            )
        );
  Offset get driverPosition => state.driverPosition;

  Offset get pickupPosition => state.pickupPosition;
  
  void moveDriver(Offset position) {
    state = state.copyWith(
      driverPosition: position,
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