import 'package:flutter/material.dart';

class RideBottomPanel extends StatelessWidget {
  final Widget child;

  const RideBottomPanel({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(30),
      ),
      child: SafeArea(
        top: false,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(
            24,
            16,
            24,
            24,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}