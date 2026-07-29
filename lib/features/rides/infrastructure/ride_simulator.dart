import 'dart:async';

class RideSimulator {
  Timer? _timer;

  RideSimulator();

  void start({
    required Future<void> Function() onFinished,
  }) {
    _timer?.cancel();

    _timer = Timer(
      const Duration(seconds: 3),
      () {
        onFinished();
      },
    );
  }

  void stop() {
    _timer?.cancel();
  }
}