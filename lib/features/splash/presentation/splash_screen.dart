import 'dart:async';

import 'package:flutter/material.dart';

import '../../../app/theme/app_text_styles.dart';
import '../../../core/widgets/tussen_loading.dart';
import '../../../core/widgets/tussen_logo.dart';
import '../../../core/widgets/tussen_scaffold.dart';
//import '../../authentication/presentation/welcome_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      if (!mounted) return;

      context.go(AppRoutes.welcome);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const TussenScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TussenLogo(),

            SizedBox(height: 24),

            Text(
              'TUSSEN',
            ),

            SizedBox(height: 8),

            Text(
              'You call, we are there.',
            ),

            SizedBox(height: 40),

            TussenLoading(),
          ],
        ),
      ),
    );
  }
}