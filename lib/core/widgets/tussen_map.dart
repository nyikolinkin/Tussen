import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../maps/providers/map_state_provider.dart';
import '../maps/models/driver_status.dart';

class TussenMap extends ConsumerWidget {
  const TussenMap({super.key});

  Color _driverColor(DriverStatus status) {
  switch (status) {
    case DriverStatus.available:
      return Colors.green;

    case DriverStatus.assigned:
      return Colors.amber;

    case DriverStatus.arriving:
      return Colors.orange;

    case DriverStatus.waiting:
      return Colors.deepOrange;

    case DriverStatus.onTrip:
      return Colors.blue;

    case DriverStatus.offline:
      return Colors.grey;
  }
}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapState = ref.watch(mapStateProvider);

    return Container(
      color: Colors.grey.shade300,
      child: Stack(
        children: [

          // ==========================================================
          // CHANGED
          //
          // Was:
          // A single Positioned widget using mapState.driverPosition.
          //
          // Now:
          // We loop through every driver in the fleet and draw
          // one taxi for each driver.
          // ==========================================================
          ...mapState.drivers.map(
            (driver) => Positioned(
              left: driver.position.dx,
              top: driver.position.dy,
              child: Icon(
                Icons.local_taxi,
                size: 40,

                // Optional:
                // Grey taxis are busy.
                // Green taxis are available.
                color: _driverColor(driver.status)
                    //? Colors.green
                    //: Colors.grey,
              ),
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