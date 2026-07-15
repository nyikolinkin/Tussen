import 'package:flutter/material.dart';

import '../widgets/ride_bottom_panel.dart';

class SearchingPanel extends StatelessWidget {
  const SearchingPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return RideBottomPanel(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [

          CircularProgressIndicator(),

          SizedBox(height: 24),

          Text(
            "Searching for nearby drivers...",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10),

          Text(
            "Please wait while we find the closest available driver.",
            textAlign: TextAlign.center,
          ),

        ],
      ),
    );
  }
}