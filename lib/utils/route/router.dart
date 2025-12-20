import 'package:flutter/material.dart';
import 'package:the_indian_souls/screens/Pages/auth/views/login_screen.dart';
import 'package:the_indian_souls/screens/Pages/auth/views/signup_screen.dart';
import 'package:the_indian_souls/screens/Pages/dashboard.dart';
import 'package:the_indian_souls/screens/Pages/onboarding/views/onboarding_screen.dart';
import 'package:the_indian_souls/screens/Pages/settings/views/display_brightness.dart';
import 'package:the_indian_souls/utils/route/route_constants.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case onboardingScreenRoute:
      return MaterialPageRoute(builder: (context) => const OnBoardingScreen());
    case logInScreenRoute:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case signUpScreenRoute:
      return MaterialPageRoute(builder: (context) => const SignUpScreen());
    case dashboardScreenRoute:
      return MaterialPageRoute(builder: (context) => const Dashboard());
    case displayBrightness:
      return MaterialPageRoute(builder: (context) => const DisplayBrightness());
    default:
      return MaterialPageRoute(
        builder: (context) => const OnBoardingScreen(),
      );
  }
}
