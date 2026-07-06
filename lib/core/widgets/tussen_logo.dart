import 'package:flutter/material.dart';

class TussenLogo extends StatelessWidget {
  final double size;

  const TussenLogo({
    super.key,
    this.size = 170,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/tussen_logo.png',
      width: size,
      fit: BoxFit.contain,
    );
  }
}