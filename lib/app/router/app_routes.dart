class AppRoutes {
  AppRoutes._();

  // Initial Flow
  static const splash = '/';
  static const welcome = '/welcome';

  // Authentication
  static const passengerPhone = '/passenger-phone';
  static const driverPhone = '/driver-phone';
  static const otp = '/otp';
  static const completeProfile = '/complete-profile';

  // Home
  static const passengerHome = '/passenger-home';
  static const driverHome = '/driver-home';

  // Locations
  static const locationSearch = '/location-search';

  // Navigation
  static const trips = '/trips';
  static const wallet = '/wallet';
  static const profile = '/profile';

  // Ride Request
  static const searchingDriver = '/searching-driver';
  static const driverFound = '/driver-found';
}