import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';

class TussenTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const TussenTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}