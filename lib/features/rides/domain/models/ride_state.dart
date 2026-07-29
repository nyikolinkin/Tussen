import 'driver.dart';
import 'ride_stage.dart';

class RideState {
  final RideStage stage;
  final Driver? driver;

  final double remainingDistance;
  final int etaSeconds;

  const RideState({
    required this.stage,
    this.driver,
    this.remainingDistance = 0,
    this.etaSeconds = 0,
  });

  RideState copyWith({
    RideStage? stage,
    Driver? driver,
    bool clearDriver = false,
    double? remainingDistance,
    int? etaSeconds,
  }) {
    return RideState(
      stage: stage ?? this.stage,
      driver: clearDriver ? null : (driver ?? this.driver),
      remainingDistance:
          remainingDistance ?? this.remainingDistance,
      etaSeconds:
          etaSeconds ?? this.etaSeconds,
    );
  }
}