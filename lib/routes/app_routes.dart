import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/home_screen.dart';


class AppRoutes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';

 
  static Map<String, WidgetBuilder> get routes {
    return {
      login: (context) => const LoginScreen(),
      signup: (context) => const SignUpScreen(),
      home: (context) => const HomeScreen(),
    };
  }
}


class HomeScreenArgs {
  final String name;

  const HomeScreenArgs({required this.name});
}
