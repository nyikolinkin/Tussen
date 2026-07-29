import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import '../../../core/maps/constants/map_constants.dart';

class MapSimulator {
  // ==========================================================
  // NEW
  //
  // Which driver is being moved?
  //
  // This allows one simulator to move ANY taxi.
  // ==========================================================
  final String driverId;

  final Offset start;
  final Offset destination;

  // ==========================================================
  // CHANGED
  //
  // We now tell the listener BOTH:
  // - which driver moved
  // - where it moved to
  // ==========================================================
  final void Function(
    String driverId,
    Offset position,
  ) onDriverMoved;

  final VoidCallback? onJourneyStarted;
  final VoidCallback? onJourneyCompleted;
  

  Timer? _timer;

  MapSimulator({
  required this.driverId,
  required this.start,
  required this.destination,
  required this.onDriverMoved,
  this.onJourneyStarted,
  this.onJourneyCompleted,
  this.onDistanceChanged,
});

  void startSimulation() {
    _timer?.cancel();

    Offset current = start;

    // Notify that the journey has started.
    onJourneyStarted?.call();

    // Place the driver exactly at the starting point.
    onDriverMoved(
      driverId,
      current,
    );

    _timer = Timer.periodic(
      MapConstants.simulationTick,
      (timer) {
        final speed = MapConstants.unitsPerTick;

        final dx = destination.dx - current.dx;
        final dy = destination.dy - current.dy;

        final distance = sqrt(dx * dx + dy * dy);
        onDistanceChanged?.call(distance);
        if (distance <= speed) {
          // Snap exactly onto the destination.
          onDriverMoved(
            driverId,
            destination,
          );

          timer.cancel();

          // Notify the controller that the journey is complete.
          onJourneyCompleted?.call();

          return;
        }

        current = Offset(
          current.dx + dx / distance * speed,
          current.dy + dy / distance * speed,
          
        );
        
        onDriverMoved(
          driverId,
          current,
        );
      },
    );
  }

  final void Function(double remainingDistance)? onDistanceChanged;

  void stop() {
    _timer?.cancel();
  }
}