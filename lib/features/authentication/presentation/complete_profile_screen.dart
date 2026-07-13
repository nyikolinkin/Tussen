import 'package:flutter/material.dart';

import '../../../core/widgets/tussen_button.dart';
import '../../../core/widgets/tussen_scaffold.dart';
import '../../../core/widgets/tussen_screen_header.dart';
import '../../../core/widgets/tussen_text_field.dart';
import 'package:go_router/go_router.dart';
import '../../../app/router/app_routes.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TussenScaffold(
      showAppBar: true,
      title: 'Complete Profile',
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            const TussenScreenHeader(
              title: 'Almost Done',
              subtitle:
                  'Tell us a little about yourself to complete your account.',
            ),

            const SizedBox(height: 40),

            const TussenTextField(
              hint: 'First Name',
              icon: Icons.person_outline,
            ),

            const SizedBox(height: 20),

            const TussenTextField(
              hint: 'Last Name',
              icon: Icons.person_outline,
            ),

            const SizedBox(height: 20),

            const TussenTextField(
              hint: 'Email Address',
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 20),

            const TussenTextField(
              hint: 'National ID / Passport',
              icon: Icons.badge_outlined,
            ),

            const SizedBox(height: 40),

            TussenButton(
              text: 'Complete Registration',
              onPressed: () {
              context.go(AppRoutes.passengerHome);
              },
            ),
          ],
        ),
      ),
    );
  }
}