import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/enums/location_type.dart';
import '../../../core/providers/location_provider.dart';

class LocationSearchScreen extends ConsumerWidget {
  final LocationType locationType;

  const LocationSearchScreen({
    super.key,
    required this.locationType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locations = [
      'Home',
      'Work',
      'Thulamahashe Mall',
      'Bushbuckridge Taxi Rank',
      'Mapulaneng Hospital',
      'Acornhoek Mall',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          locationType == LocationType.pickup
              ? 'Choose Pickup Location'
              : 'Choose Destination',
        ),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          final location = locations[index];

          return ListTile(
            leading: const Icon(Icons.location_on),
            title: Text(location),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              if (locationType == LocationType.pickup) {
                ref.read(pickupLocationProvider.notifier).state = location;
              } else {
                ref.read(destinationProvider.notifier).state = location;
              }

              context.pop();
            },
          );
        },
      ),
    );
  }
}