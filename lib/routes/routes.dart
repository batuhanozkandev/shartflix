import 'package:flutter/material.dart';
import 'package:shartflix/view/auth/log_in_screen.dart';
import 'package:shartflix/view/auth/sign_up_screen.dart';
import 'package:shartflix/view/profile/add_profile_photo_screen.dart';
class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppPages.logInScreen: (_) => const LogInScreen(),
    AppPages.signUpScreen: (_) => const SignUpScreen(),
    AppPages.addProfilePhotoScreen: (_) => const AddProfilePhotoScreen(),
  };
}

class AppPages {
  static String logInScreen = '/logInScreen';
  static String signUpScreen = '/signUpScreen';
  static String addProfilePhotoScreen = '/addProfilePhotoScreen';
}
