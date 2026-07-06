import 'package:flutter/material.dart';

import '../../../app/theme/app_text_styles.dart';
import '../../../core/widgets/tussen_button.dart';
import '../../../core/widgets/tussen_logo.dart';
import '../../../core/widgets/tussen_outlined_button.dart';
import '../../../core/widgets/tussen_scaffold.dart';
import '../../../core/widgets/tussen_text_button.dart';
import 'login_screen.dart';
import 'package:go_router/go_router.dart';
import '../../../app/router/app_routes.dart';

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

          Text(
            'TUSSEN',
            style: AppTextStyles.heading1,
          ),

          const SizedBox(height: 8),

          Text(
            'You call, we are there.',
            style: AppTextStyles.caption,
          ),

          const Spacer(),

          TussenButton(
            text: 'Get a Ride',
            onPressed: () {
              context.go(AppRoutes.login);
                          },
          ),

          const SizedBox(height: 16),

          TussenOutlinedButton(
            text: 'Drive with Tussen',
            onPressed: () {
              // TODO: Navigate to Driver Login
            },
          ),

          const SizedBox(height: 24),

          TussenTextButton(
            text: 'Already have an account? Sign In',
            onPressed: () {
              // TODO: Navigate to Sign In
            },
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}