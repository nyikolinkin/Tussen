import 'package:flutter/material.dart';

import '../../../app/theme/app_text_styles.dart';
import '../../../core/widgets/tussen_button.dart';
import '../../../core/widgets/tussen_logo.dart';
import '../../../core/widgets/tussen_scaffold.dart';
import '../../../core/widgets/tussen_otp_field.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TussenScaffold(
      showAppBar: true,
      title: 'Verify Number',
      child: Column(
        children: [

          const SizedBox(height: 20),

          const TussenLogo(size: 100),

          const SizedBox(height: 30),

          Text(
            "Verification Code",
            style: AppTextStyles.heading1,
          ),

          const SizedBox(height: 8),

          Text(
            "Enter the 6-digit code sent to your phone.",
            style: AppTextStyles.caption,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 40),

          TussenOtpField(
  onCompleted: (code) {
    debugPrint('OTP: $code');
  },
),

          const SizedBox(height: 40),

          TussenButton(
            text: "Verify",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}