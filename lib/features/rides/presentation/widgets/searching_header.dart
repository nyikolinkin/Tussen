import 'package:flutter/material.dart';

import '../../../../app/theme/app_text_styles.dart';
import '../../../../core/widgets/tussen_logo.dart';

class SearchingHeader extends StatelessWidget {
  const SearchingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TussenLogo(size: 110),

        const SizedBox(height: 24),

        Text(
          'Finding your driver',
          style: AppTextStyles.heading1,
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 12),

        Text(
          'Please wait while we locate the nearest available driver.',
          style: AppTextStyles.body,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}