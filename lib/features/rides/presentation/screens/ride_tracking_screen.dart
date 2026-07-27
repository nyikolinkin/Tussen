import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/ride_state_provider.dart';
import '../widgets/ride_stage_panel.dart';
import '../../../../core/widgets/tussen_map.dart';
//import '../../../../core/maps/providers/map_simulator_provider.dart';
//import '../../providers/ride_controller_provider.dart';

class RideTrackingScreen extends ConsumerWidget {
  const RideTrackingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(rideStateProvider); // We'll use this later

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ride Tracking'),
      ),
      body: Stack(
        children: [
          const TussenMap(),

          const Align(
            alignment: Alignment.bottomCenter,
            child: RideStagePanel(),
          ),
        ],
      ),

      //floatingActionButton: FloatingActionButton.extended(
        //onPressed: () {
          //ref.read(rideControllerProvider).requestRide();
        //},
        //icon: const Icon(Icons.bug_report),
        //label: const Text('Next Stage'),
      //),
    );
  }
}