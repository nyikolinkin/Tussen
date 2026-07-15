import 'package:flutter/material.dart';

class DriverAvatar extends StatelessWidget {
  final double radius;

  const DriverAvatar({
    super.key,
    this.radius = 40,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: Icon(
        Icons.person,
        size: radius,
      ),
    );
  }
}