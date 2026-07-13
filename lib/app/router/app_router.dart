import 'package:go_router/go_router.dart';

import 'app_routes.dart';

import '../../core/enums/user_type.dart';
import '../../core/enums/location_type.dart';

import '../../features/splash/presentation/splash_screen.dart';
import '../../features/authentication/presentation/welcome_screen.dart';
import '../../features/authentication/presentation/phone_verification_screen.dart';
import '../../features/authentication/presentation/otp_screen.dart';
import '../../features/authentication/presentation/complete_profile_screen.dart';
import '../../features/passenger/presentation/passenger_home_screen.dart';
import '../../features/passenger/presentation/location_search_screen.dart';
import '../../features/passenger/presentation/trips_screen.dart';
import '../../features/passenger/presentation/wallet_screen.dart';
import '../../../features/rides/presentation/screens/searching_driver_screen.dart';
//import '../../features/passenger/presentation/profile_screen.dart';

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
      GoRoute( 
        path: AppRoutes.completeProfile, 
        builder: (context, state) => const CompleteProfileScreen(), 
        ),
      GoRoute(
        path: AppRoutes.passengerHome,
        builder: (context, state) => const PassengerHomeScreen(),
        ),
        GoRoute(
        path: AppRoutes.locationSearch,
        builder: (context, state) {
        final type = state.extra as LocationType;

        return LocationSearchScreen(
        locationType: type,
        );
        },
      ),
      GoRoute(
  path: AppRoutes.trips,
  builder: (context, state) => const TripsScreen(),
),

GoRoute(
  path: AppRoutes.wallet,
  builder: (context, state) => const WalletScreen(),
),

GoRoute(
  path: AppRoutes.searchingDriver,
  builder: (context, state) => const SearchingDriverScreen(),
),

    ],
  );
  
}