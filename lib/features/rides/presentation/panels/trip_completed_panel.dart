import 'package:flutter/material.dart';

import '../widgets/ride_bottom_panel.dart';
import '../widgets/ride_header.dart';

class TripCompletedPanel extends StatelessWidget {
  const TripCompletedPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return RideBottomPanel(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const RideHeader(
            icon: Icons.check_circle,
            color: Colors.green,
            title: 'Trip Completed',
            subtitle: 'Thank you for choosing Tussen!',
          ),

          const SizedBox(height: 24),

          const Icon(
            Icons.emoji_emotions,
            size: 80,
            color: Colors.green,
          ),

          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () {
                // Rating screen later
              },
              icon: const Icon(Icons.star),
              label: const Text('Rate Driver'),
            ),
          ),
        ],
      ),
    );
  }
}