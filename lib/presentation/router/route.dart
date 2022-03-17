import 'package:flutter/material.dart';
import 'package:learn_bloc/presentation/screens/home_screen.dart';
import 'package:learn_bloc/presentation/screens/second_screen.dart';
import 'package:learn_bloc/presentation/screens/third_screen.dart';

class PageRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return _buildRouter(
          routeSettings: routeSettings,
          builder: (args) => const HomeScreen(
            title: 'Home Screen',
            color: Colors.blueAccent,
          ),
        );

      case '/second':
        return _buildRouter(
          routeSettings: routeSettings,
          builder: (args) => const SecondScreen(
            title: 'Second Screen',
            color: Colors.orangeAccent,
          ),
        );

      case '/third':
        return _buildRouter(
          routeSettings: routeSettings,
          builder: (args) => const ThirdScreen(
            title: 'Third Screen',
            color: Colors.redAccent,
          ),
        );

      default:
        return null;
    }
  }

  Route<dynamic> _buildRouter({
    required RouteSettings routeSettings,
    required Widget Function(Object? arguments) builder,
  }) {
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_) => builder(routeSettings.arguments),
    );
  }
}
