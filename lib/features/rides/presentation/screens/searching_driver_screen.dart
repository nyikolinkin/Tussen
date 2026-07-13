import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../app/theme/app_text_styles.dart';
import '../../../../core/widgets/feedback/animated_status_text.dart';
import '../widgets/cancel_request_button.dart';
import '../widgets/searching_header.dart';
import '../widgets/searching_indicator.dart';

class SearchingDriverScreen extends StatelessWidget {
  const SearchingDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),

              const SearchingHeader(),

              const SizedBox(height: 40),

              AnimatedStatusText(
                messages: const [
                  'Finding nearby drivers...',
                  'Checking driver availability...',
                  'Choosing the closest driver...',
                  'Almost there...',
                ],
                style: AppTextStyles.body,
                onCompleted: () {
                  context.go(AppRoutes.driverFound);
                },
              ),

              const SizedBox(height: 24),

              const SearchingIndicator(),

              const Spacer(),

              CancelRequestButton(
                onPressed: () {
                  _showCancelDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCancelDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Cancel Request?'),
          content: const Text(
            'Your driver search will stop and you will return to the home screen.',
          ),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                context.pop(); // Close dialog
                context.pop(); // Back to Home
              },
              child: const Text('Yes, Cancel'),
            ),
          ],
        );
      },
    );
  }
}