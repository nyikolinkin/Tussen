import 'driver_card.dart';
import 'ride_stage.dart';

class RideState {
  final RideStage stage;
  final Driver? driver;

  const RideState({
    required this.stage,
    this.driver,
  });

  RideState copyWith({
    RideStage? stage,
    Driver? driver,
  }) {
    return RideState(
      stage: stage ?? this.stage,
      driver: driver ?? this.driver,
    );
  }
}