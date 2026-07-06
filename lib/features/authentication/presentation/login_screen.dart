import 'package:flutter/material.dart';

import '../../../app/theme/app_text_styles.dart';
import '../../../core/widgets/tussen_button.dart';
import '../../../core/widgets/tussen_logo.dart';
import '../../../core/widgets/tussen_scaffold.dart';
import '../../../core/widgets/tussen_text_button.dart';
import '../../../core/widgets/tussen_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TussenScaffold(
      showAppBar: true,
      title: 'Passenger Login',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 20),

          const Center(
            child: TussenLogo(size: 110),
          ),

          const SizedBox(height: 30),

          Text(
            'Welcome Back',
            style: AppTextStyles.heading1,
          ),

          const SizedBox(height: 8),

          Text(
            'Enter your mobile number to continue.',
            style: AppTextStyles.caption,
          ),

          const SizedBox(height: 40),

          const TussenTextField(
            hint: 'Mobile Number',
            icon: Icons.phone_android,
          ),

          const SizedBox(height: 30),

          TussenButton(
            text: 'Continue',
            onPressed: () {
              // TODO: Navigate to OTP Screen
            },
          ),

          const SizedBox(height: 20),

          Center(
            child: TussenTextButton(
              text: "Don't have an account? Register",
              onPressed: () {},
            ),
          ),

        ],
      ),
    );
  }
}