import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';

class TussenScaffold extends StatelessWidget {
  final Widget child;
  final String? title;
  final bool showAppBar;

  const TussenScaffold({
    super.key,
    required this.child,
    this.title,
    this.showAppBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: showAppBar
          ? AppBar(
              title: Text(title ?? ''),
              centerTitle: true,
              elevation: 0,
            )
          : null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          child: child,
        ),
      ),
    );
  }
}