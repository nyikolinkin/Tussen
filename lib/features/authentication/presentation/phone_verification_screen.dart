import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/app_routes.dart';
import '../../../core/enums/user_type.dart';
import '../../../core/widgets/tussen_button.dart';
import '../../../core/widgets/tussen_logo.dart';
import '../../../core/widgets/tussen_scaffold.dart';
import '../../../core/widgets/tussen_screen_header.dart';
import '../../../core/widgets/tussen_text_field.dart';

class PhoneVerificationScreen extends StatelessWidget {
  final UserType userType;

  const PhoneVerificationScreen({
    super.key,
    required this.userType,
  });

  String get appBarTitle =>
      userType == UserType.passenger
          ? 'Continue as Passenger'
          : 'Drive with Tussen';

  String get heading =>
      userType == UserType.passenger
          ? "Let's get you moving"
          : "Driver Verification";

  String get subtitle =>
      userType == UserType.passenger
          ? "Enter your mobile number and we'll verify your account."
          : "Enter your driver mobile number and we'll verify your account.";

  @override
  Widget build(BuildContext context) {
    return TussenScaffold(
      showAppBar: true,
      title: appBarTitle,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            const Center(
              child: TussenLogo(size: 110),
            ),

            const SizedBox(height: 30),

            TussenScreenHeader(
              title: heading,
              subtitle: subtitle,
            ),

            const SizedBox(height: 40),

            const TussenTextField(
              hint: 'Mobile Number',
              icon: Icons.phone_android,
              keyboardType: TextInputType.phone,
            ),

            const SizedBox(height: 30),

            TussenButton(
              text: 'Send Verification Code',
              onPressed: () {
                context.go(AppRoutes.otp);
              },
            ),
          ],
        ),
      ),
    );
  }
}