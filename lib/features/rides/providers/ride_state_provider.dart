import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/enums/driver_status.dart';
import '../../../../core/enums/gender.dart';
import '../domain/models/driver_card.dart';
import '../domain/models/ride_stage.dart';
import '../domain/models/ride_state.dart';

class RideStateNotifier extends StateNotifier<RideState> {
  RideStateNotifier()
      : super(
          const RideState(
            stage: RideStage.searching,

            driver: Driver(
              id: 'drv_001',
              name: 'Thandi M.',
              gender: Gender.female,
              status: DriverStatus.available,
              vehicle: 'Toyota Starlet',
              vehicleColor: 'White',
              registrationNumber: 'KXY 214 MP',
              rating: 5.0,
              etaMinutes: 2,
            ),
          ),
        );

  void setStage(RideStage stage) {
    // ✅ DEBUG
    print('Changing stage: ${state.stage} -> $stage');

    state = state.copyWith(stage: stage);

    // ✅ DEBUG
    print('Current stage is now: ${state.stage}');
  }

  void nextStage() {
    // ✅ DEBUG
    print('Next Stage button pressed');

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
        setStage(RideStage.searching);
        break;
    }
  }
}

final rideStateProvider =
    StateNotifierProvider<RideStateNotifier, RideState>(
  (ref) => RideStateNotifier(),
);