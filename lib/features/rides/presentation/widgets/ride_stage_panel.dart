import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/ride_state_provider.dart';
import '../../factories/panel_factory.dart';

class RideStagePanel extends ConsumerWidget {
  const RideStagePanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rideState = ref.watch(rideStateProvider);

    return PanelFactory.build(rideState);
  }
}