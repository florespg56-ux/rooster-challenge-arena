import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/home_screen.dart';

/// Navigation & Routing Lead's main deliverable.
///
/// All named routes live here in one place, rather than scattered across
/// the app, so the navigation map is easy to review and extend.
class AppRoutes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';

  /// Registered with MaterialApp's `routes` property.
  static Map<String, WidgetBuilder> get routes {
    return {
      login: (context) => const LoginScreen(),
      signup: (context) => const SignUpScreen(),
      home: (context) => const HomeScreen(),
    };
  }
}

/// Simple typed payload passed from Sign-Up (and Login) to Home via
/// route arguments, instead of passing loose, unlabelled objects.
class HomeScreenArgs {
  final String name;

  const HomeScreenArgs({required this.name});
}
