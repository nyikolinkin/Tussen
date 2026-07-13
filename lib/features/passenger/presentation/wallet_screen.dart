import 'package:flutter/material.dart';

import '../../../app/theme/app_text_styles.dart';
import '../../../core/enums/passenger_tab.dart';
import '../../passenger/presentation/scaffolds/passenger_scaffold.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PassengerScaffold(
      currentTab: PassengerTab.wallet,
      child: Center(
        child: Text(
          'Wallet',
          style: AppTextStyles.heading1,
        ),
      ),
    );
  }
}