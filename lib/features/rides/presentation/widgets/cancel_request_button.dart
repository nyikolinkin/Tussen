import 'package:flutter/material.dart';

import '../../../../core/widgets/tussen_outlined_button.dart';

class CancelRequestButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CancelRequestButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TussenOutlinedButton(
      text: 'Cancel Request',
      onPressed: onPressed,
    );
  }
}