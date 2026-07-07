import 'package:flutter/material.dart';

import '../../app/theme/app_text_styles.dart';

class TussenScreenHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextAlign textAlign;

  const TussenScreenHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: textAlign == TextAlign.center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: textAlign,
          style: AppTextStyles.heading1,
        ),

        const SizedBox(height: 10),

        Text(
          subtitle,
          textAlign: textAlign,
          style: AppTextStyles.caption,
        ),
      ],
    );
  }
}