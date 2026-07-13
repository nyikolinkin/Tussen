import 'package:flutter/material.dart';

import '../../../../core/enums/passenger_tab.dart';
import '../../../../core/navigation/passenger_navigation.dart';
import '../../../../core/widgets/tussen_app_bar.dart';
import '../../../../core/widgets/tussen_bottom_nav.dart';

class PassengerScaffold extends StatelessWidget {
  final Widget child;
  final PassengerTab currentTab;

  const PassengerScaffold({
    super.key,
    required this.child,
    required this.currentTab,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TussenAppBar(
        greeting: 'Good Evening 👋',
        name: 'Piki',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: child,
        ),
      ),
      bottomNavigationBar: TussenBottomNav(
        currentIndex: currentTab.index,
        onTap: (index) {
          PassengerNavigation.navigate(context, index);
        },
      ),
    );
  }
}