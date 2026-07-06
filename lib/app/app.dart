import 'package:flutter/material.dart';

import '../features/splash/presentation/splash_screen.dart';
import 'theme/app_theme.dart';

class TussenApp extends StatelessWidget {
  const TussenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tussen',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}