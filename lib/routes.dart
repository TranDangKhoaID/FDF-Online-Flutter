import 'package:flutter/material.dart';
import 'package:pdf_online/screens/home_screen/home_screen.dart';
import 'package:pdf_online/screens/splash_screen/splash_screen.dart';

class AppRoute {
  /// MARK: - Initials;
  static const String splashScreen = '/splash-screen';

  static const String homeScreen = '/home-screen';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('page_not_found'),
        ),
      );
    });
  }
}
