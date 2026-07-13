import 'package:flutter/material.dart';

import '../../../app/theme/app_text_styles.dart';
import '../../../core/enums/passenger_tab.dart';
import '../../passenger/presentation/scaffolds/passenger_scaffold.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PassengerScaffold(
      currentTab: PassengerTab.trips,
      child: Center(
        child: Text(
          'Trips',
          style: AppTextStyles.heading1,
        ),
      ),
    );
  }
}