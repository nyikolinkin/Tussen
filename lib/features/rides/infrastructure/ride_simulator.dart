import 'dart:async';

import '../domain/models/ride_stage.dart';

class RideSimulator {
  Timer? _timer;

  final void Function(RideStage stage) onStageChanged;

  RideSimulator({
    required this.onStageChanged,
  });

  void start() {
    _timer?.cancel();

    final stages = [
      RideStage.driverFound,
    ];

    int index = 0;

    _timer = Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        if (index >= stages.length) {
          timer.cancel();
          return;
        }

        onStageChanged(stages[index]);

        index++;
      },
    );
  }

  void stop() {
    _timer?.cancel();
  }
}