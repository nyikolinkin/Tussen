import 'package:go_router/go_router.dart';

import 'app_routes.dart';

import '../../core/enums/user_type.dart';

import '../../features/splash/presentation/splash_screen.dart';
import '../../features/authentication/presentation/welcome_screen.dart';
import '../../features/authentication/presentation/phone_verification_screen.dart';
import '../../features/authentication/presentation/otp_screen.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        path: AppRoutes.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),

      GoRoute(
        path: AppRoutes.passengerPhone,
        builder: (context, state) => const PhoneVerificationScreen(
          userType: UserType.passenger,
        ),
      ),

      GoRoute(
        path: AppRoutes.driverPhone,
        builder: (context, state) => const PhoneVerificationScreen(
          userType: UserType.driver,
        ),
      ),

      GoRoute(
        path: AppRoutes.otp,
        builder: (context, state) => const OtpScreen(),
      ),
    ],
  );
}