import 'dart:async';

import '../domain/models/ride_stage.dart';
import '../providers/ride_state_provider.dart';

class RideSimulator {
  final RideStateNotifier notifier;

  RideSimulator(this.notifier);

  Future<void> simulateAcceptance() async {
    await Future.delayed(const Duration(seconds: 3));

    notifier.setStage(RideStage.accepted);
  }
}