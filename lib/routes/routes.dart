import 'package:coffee_mile/presentation/auth/log_in_screen.dart';
import 'package:coffee_mile/presentation/coffee_detail/coffee_detail_screen.dart';
import 'package:coffee_mile/presentation/main/main_screen.dart';
import 'package:coffee_mile/presentation/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

import '../presentation/auth/sign_up_screen.dart';
import '../presentation/home/home_screen.dart';
class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppPages.welcomeScreen: (_) => const WelcomeScreen(),
    AppPages.logInScreen: (_) => const LogInScreen(),
    AppPages.signUpScreen: (_) => const SignUpScreen(),
    AppPages.mainScreen: (_) => const MainScreen(),
    AppPages.homeScreen: (_) => const HomeScreen(),
    AppPages.coffeeDetailScreen: (_) => const CoffeeDetailScreen(),

  };
}

class AppPages {
  static String logInScreen = '/logInScreen';
  static String signUpScreen = '/signUpScreen';
  static String mainScreen = '/mainScreen';
  static String homeScreen = '/homeScreen';
  static String welcomeScreen = '/welcomeScreen';
  static String coffeeDetailScreen = '/coffeeDetailScreen';
}
