import 'package:flutter/material.dart';

import '../../domain/models/driver.dart';
import 'driver_avatar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/ride_state_provider.dart';

class DriverCard extends ConsumerWidget {
  final Driver driver;

  const DriverCard({
    super.key,
    required this.driver,
  });

  
  @override
  Widget build(
  BuildContext context,
  WidgetRef ref,
) {
    final ride = ref.watch(rideStateProvider);
    String etaText;

if (ride.etaSeconds <= 0) {
  etaText = 'Arriving';
} else if (ride.etaSeconds < 60) {
  etaText = '${ride.etaSeconds} sec';
} else {
  etaText =
      '${(ride.etaSeconds / 60).ceil()} min';
}
    String distanceText;

if (ride.remainingDistance >= 1000) {
  distanceText =
      '${(ride.remainingDistance / 1000).toStringAsFixed(1)} km';
} else {
  distanceText =
      '${ride.remainingDistance.round()} m';
}
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Driver photo
            const DriverAvatar(),

            const SizedBox(width: 16),

            // Driver details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Name + Rating
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          driver.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),

                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18,
                      ),

                      const SizedBox(width: 4),

                      Text(
                        driver.rating.toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  // Vehicle
                  Text(
                    '${driver.vehicle} • ${driver.vehicleColor}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  const SizedBox(height: 4),

                  // Registration + ETA
                  Row(
                    children: [

                      Expanded(
                        child: Text(
                          driver.registrationNumber,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: Colors.grey[700],
                              ),
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                                  '$etaText • $distanceText',
                                  style: TextStyle(
                                  color: Colors.green.shade700,
                                  fontWeight: FontWeight.w600,
                              ),
                          )
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}