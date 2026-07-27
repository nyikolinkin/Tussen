import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class MapSimulator {
  final Offset start;
  final Offset destination;

  /// Called every time the driver's position changes.
  final void Function(Offset position) onDriverMoved;

  // ==========================================================
  // NEW
  //
  // Called once when the taxi starts moving.
  //
  // This allows RideController to change the ride stage to
  // Trip In Progress, Driver Arriving, etc.
  // ==========================================================
  final VoidCallback? onJourneyStarted;

  // ==========================================================
  // Called once when the taxi reaches its destination.
  // ==========================================================
  final VoidCallback? onJourneyCompleted;

  Timer? _timer;

  MapSimulator({
    required this.start,
    required this.destination,
    required this.onDriverMoved,

    // NEW
    this.onJourneyStarted,

    this.onJourneyCompleted,
  });

  void startSimulation() {
    _timer?.cancel();

    Offset current = start;

    // ==========================================================
    // Ensure the taxi starts exactly where this journey begins.
    // ==========================================================
    onDriverMoved(current);

    // ==========================================================
    // NEW
    //
    // Notify the controller that movement has begun.
    //
    // The simulator does NOT decide what stage comes next.
    // It simply reports:
    // "I'm moving now."
    // ==========================================================
    onJourneyStarted?.call();
    print("MapSimulator started");

    _timer = Timer.periodic(
      const Duration(milliseconds: 50),
      (timer) {
        const speed = 2.0;

        final dx = destination.dx - current.dx;
        final dy = destination.dy - current.dy;

        final distance = sqrt(dx * dx + dy * dy);

        if (distance <= speed) {
          // Snap exactly onto the destination.
          onDriverMoved(destination);

          timer.cancel();

          // Notify the controller that the journey is complete.
          onJourneyCompleted?.call();

          return;
        }

        current = Offset(
          current.dx + (dx / distance) * speed,
          current.dy + (dy / distance) * speed,
        );

        onDriverMoved(current);
      },
    );
  }

  void stop() {
    _timer?.cancel();
  }
}