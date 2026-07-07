import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/app_routes.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/widgets/tussen_button.dart';
import '../../../core/widgets/tussen_logo.dart';
import '../../../core/widgets/tussen_outlined_button.dart';
import '../../../core/widgets/tussen_scaffold.dart';
import '../../../core/widgets/tussen_screen_header.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TussenScaffold(
      child: Column(
        children: [
          const Spacer(),

          const TussenLogo(size: 160),

          const SizedBox(height: 24),

          const TussenScreenHeader(
  title: 'TUSSEN',
  subtitle: 'You call, we are there.',
  textAlign: TextAlign.center,
),

          const Spacer(),

          TussenButton(
            text: 'Continue as Passenger',
            onPressed: () {
              context.go(AppRoutes.passengerPhone);
            },
          ),

          const SizedBox(height: 16),

          TussenOutlinedButton(
            text: 'Drive with Tussen',
            onPressed: () {
              context.go(AppRoutes.driverPhone);
            },
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}