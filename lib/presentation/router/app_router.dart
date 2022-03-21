import 'package:flutter/material.dart';
import 'package:learn_bloc/presentation/pages/home_screen.dart';
import 'package:learn_bloc/presentation/pages/setting_screen.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomeScreen(
            title: "Home Screen",
          ),
        );
      case '/settings':
        return MaterialPageRoute(
          builder: (_) => const SettingScreen(),
        );
      default:
        return null;
    }
  }
}
