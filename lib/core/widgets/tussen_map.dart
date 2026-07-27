import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../maps/providers/map_state_provider.dart';

class TussenMap extends ConsumerWidget {
  const TussenMap({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapState = ref.watch(mapStateProvider);

    return Container(
      color: Colors.grey.shade300,
      child: Stack(
        children: [

          // 🚗 Driver
          Positioned(
            left: mapState.driverPosition.dx,
            top: mapState.driverPosition.dy,
            child: const Icon(
              Icons.local_taxi,
              size: 40,
              color: Colors.green,
            ),
          ),

          // 👤 Passenger
          Positioned(
            left: mapState.passengerPosition.dx,
            top: mapState.passengerPosition.dy,
            child: const Icon(
              Icons.person_pin_circle,
              size: 42,
              color: Colors.blue,
            ),
          ),

          // 📍 Pickup
          Positioned(
            left: mapState.pickupPosition.dx,
            top: mapState.pickupPosition.dy,
            child: const Icon(
              Icons.location_on,
              size: 36,
              color: Colors.orange,
            ),
          ),

          // 🏁 Destination
          Positioned(
            left: mapState.destinationPosition.dx,
            top: mapState.destinationPosition.dy,
            child: const Icon(
              Icons.flag,
              size: 36,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}