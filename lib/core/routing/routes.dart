import 'package:doctor_app/core/routing/app_router.dart';
import 'package:doctor_app/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import '../../features/login/presentation/pages/login_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        );
    }
  }
}
