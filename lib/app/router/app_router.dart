import 'package:go_router/go_router.dart';
import 'package:tussen/features/rides/presentation/screens/available_drivers_screen.dart';

import 'app_routes.dart';
import 'custom_transition_page.dart';

import '../../core/enums/location_type.dart';
import '../../core/enums/user_type.dart';

import '../../features/authentication/presentation/complete_profile_screen.dart';
import '../../features/authentication/presentation/otp_screen.dart';
import '../../features/authentication/presentation/phone_verification_screen.dart';
import '../../features/authentication/presentation/welcome_screen.dart';
import '../../features/passenger/presentation/location_search_screen.dart';
import '../../features/passenger/presentation/passenger_home_screen.dart';
import '../../features/passenger/presentation/trips_screen.dart';
import '../../features/passenger/presentation/wallet_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';
import '../../../features/rides/presentation/screens/driver_found_screen.dart';
import '../../../features/rides/presentation/screens/searching_driver_screen.dart';
import '../../features/rides/domain/models/driver_card.dart';
import '../../features/rides/presentation/screens/waiting_for_driver_response_screen.dart';
import '../../features/rides/presentation/screens/ride_tracking_screen.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        pageBuilder: (context, state) => buildPageWithTransition(
          state: state,
          child: const SplashScreen(),
        ),
      ),

      GoRoute(
        path: AppRoutes.welcome,
        pageBuilder: (context, state) => buildPageWithTransition(
          state: state,
          child: const WelcomeScreen(),
        ),
      ),

      GoRoute(
        path: AppRoutes.passengerPhone,
        pageBuilder: (context, state) => buildPageWithTransition(
          state: state,
          child: const PhoneVerificationScreen(
            userType: UserType.passenger,
          ),
        ),
      ),

      GoRoute(
        path: AppRoutes.driverPhone,
        pageBuilder: (context, state) => buildPageWithTransition(
          state: state,
          child: const PhoneVerificationScreen(
            userType: UserType.driver,
          ),
        ),
      ),

      GoRoute(
        path: AppRoutes.otp,
        pageBuilder: (context, state) => buildPageWithTransition(
          state: state,
          child: const OtpScreen(),
        ),
      ),

      GoRoute(
        path: AppRoutes.completeProfile,
        pageBuilder: (context, state) => buildPageWithTransition(
          state: state,
          child: const CompleteProfileScreen(),
        ),
      ),

      GoRoute(
        path: AppRoutes.passengerHome,
        pageBuilder: (context, state) => buildPageWithTransition(
          state: state,
          child: const PassengerHomeScreen(),
        ),
      ),

      GoRoute(
        path: AppRoutes.locationSearch,
        pageBuilder: (context, state) {
          final type = state.extra as LocationType;

          return buildPageWithTransition(
            state: state,
            child: LocationSearchScreen(
              locationType: type,
            ),
          );
        },
      ),

      GoRoute(
        path: AppRoutes.trips,
        pageBuilder: (context, state) => buildPageWithTransition(
          state: state,
          child: const TripsScreen(),
        ),
      ),

      GoRoute(
        path: AppRoutes.wallet,
        pageBuilder: (context, state) => buildPageWithTransition(
          state: state,
          child: const WalletScreen(),
        ),
      ),

      GoRoute(
        path: AppRoutes.searchingDriver,
        pageBuilder: (context, state) => buildPageWithTransition(
          state: state,
          child: const SearchingDriverScreen(),
        ),
      ),

      GoRoute(
        path: AppRoutes.driverFound,
        pageBuilder: (context, state) => buildPageWithTransition(
          state: state,
          child: const DriverFoundScreen(),
        ),
      ),

      GoRoute(
        path: AppRoutes.availableDrivers,
        pageBuilder: (context, state) => buildPageWithTransition(
          state: state,
          child: const AvailableDriversScreen(),
        ),
      ),

      GoRoute(
  path: AppRoutes.waitingForDriverResponse,
  builder: (context, state) {
    final driver = state.extra as Driver;

    return WaitingForDriverResponseScreen(
      driver: driver,
    );
  },
),

    GoRoute(
  path: AppRoutes.rideTracking,
  pageBuilder: (context, state) => buildPageWithTransition(
    state: state,
    child: const RideTrackingScreen(),
  ),
),
    ],
  );
}