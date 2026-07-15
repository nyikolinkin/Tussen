import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/ride_stage.dart';
import '../../providers/ride_state_provider.dart';
import '../panels/waiting_panel.dart';

import '../panels/searching_panel.dart';
import '../panels/driver_found_panel.dart';

class RideStagePanel extends ConsumerWidget {
  const RideStagePanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rideState = ref.watch(rideStateProvider);

    switch (rideState.stage) {
      case RideStage.searching:
        return const SearchingPanel();

      case RideStage.driverFound:
        // ✅ UPDATED: Get the driver from RideState
        return DriverFoundPanel(
          driver: rideState.driver!,
        );

      case RideStage.waitingForDriver:
        return WaitingPanel(
        driver: rideState.driver!,
        );

      default:
        return const SearchingPanel();
    }
  }
}