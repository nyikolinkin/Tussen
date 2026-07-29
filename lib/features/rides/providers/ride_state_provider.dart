import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/driver.dart';
import '../domain/models/ride_stage.dart';
import '../domain/models/ride_state.dart';

class RideStateNotifier extends StateNotifier<RideState> {
  RideStateNotifier()
      : super(
          const RideState(
            stage: RideStage.searching,
            driver: null,
          ),
        );

  RideStage get currentStage => state.stage;

  Driver? get currentDriver => state.driver;

  void setStage(RideStage stage) {
    print('Changing stage: ${state.stage} -> $stage');

    state = state.copyWith(
      stage: stage,
    );

    print('Current stage is now: ${state.stage}');
  }

  // ==========================================================
  // NEW
  // Sets the driver assigned by DispatchService
  // ==========================================================
  void setDriver(Driver driver) {
  state = state.copyWith(
    driver: driver,
  );
}

  // ==========================================================
  // NEW
  // Clears the driver after cancellation/completion
  // ==========================================================
  void clearDriver() {
  state = state.copyWith(
    clearDriver: true,
  );
}

  void updateEta({
  required double remainingDistance,
  required int etaSeconds,
}) {
  state = state.copyWith(
    remainingDistance: remainingDistance,
    etaSeconds: etaSeconds,
  );
}

  void nextStage() {
    switch (state.stage) {
      case RideStage.searching:
        setStage(RideStage.driverFound);
        break;

      case RideStage.driverFound:
        setStage(RideStage.waitingForDriver);
        break;

      case RideStage.waitingForDriver:
        setStage(RideStage.accepted);
        break;

      case RideStage.accepted:
        setStage(RideStage.driverArriving);
        break;

      case RideStage.driverArriving:
        setStage(RideStage.driverArrived);
        break;

      case RideStage.driverArrived:
        setStage(RideStage.tripStarted);
        break;

      case RideStage.tripStarted:
        setStage(RideStage.tripInProgress);
        break;

      case RideStage.tripInProgress:
        setStage(RideStage.tripCompleted);
        break;

      case RideStage.tripCompleted:
      case RideStage.cancelled:
      case RideStage.noDriverFound:
        state = const RideState(
          stage: RideStage.searching,
          driver: null,
        );
        break;
    }
  }
}

final rideStateProvider =
    StateNotifierProvider<RideStateNotifier, RideState>(
  (ref) => RideStateNotifier(),
);