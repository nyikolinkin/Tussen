import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/ride_stage.dart';
import '../infrastructure/ride_simulator.dart';
import '../providers/ride_state_provider.dart';

class RideController {
  final Ref ref;

  RideController(this.ref);

  RideStateNotifier get _notifier =>
      ref.read(rideStateProvider.notifier);

  /// Passenger requests a ride
  void requestRide() {
    _notifier.setStage(RideStage.waitingForDriver);

    RideSimulator(_notifier).simulateAcceptance();
  }

  /// Passenger cancels the ride
  void cancelRide() {
    _notifier.setStage(RideStage.cancelled);
  }

  /// Driver accepted
  void driverAccepted() {
    _notifier.setStage(RideStage.accepted);
  }

  /// Driver is on the way
  void driverArriving() {
    _notifier.setStage(RideStage.driverArriving);
  }

  /// Driver reached pickup
  void driverArrived() {
    _notifier.setStage(RideStage.driverArrived);
  }

  /// Trip started
  void startTrip() {
    _notifier.setStage(RideStage.tripStarted);
  }

  /// Trip completed
  void completeTrip() {
    _notifier.setStage(RideStage.tripCompleted);
  }
}