import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shartflix/bloc/auth_bloc/auth_bloc.dart';
import 'package:shartflix/bloc/movie_bloc/movie_bloc.dart';
import 'package:shartflix/bloc/movie_bloc/movie_event.dart';
import 'package:shartflix/routes/routes.dart';
import 'package:shartflix/view/auth/log_in_screen.dart';
import 'package:shartflix/view/auth/sign_up_screen.dart';
import 'package:shartflix/view/components.dart';
import 'package:shartflix/view/explore/explore.dart';
import 'package:shartflix/view/main/main_screen.dart';
import 'package:shartflix/view/profile/add_profile_photo_screen.dart';
import 'package:shartflix/view/splash/splash_screen.dart';

import 'bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import 'bloc/user_bloc/user_bloc.dart';
import 'bloc/user_bloc/user_event.dart';
import 'controller/theme/theme.dart';
import 'helper/app.dart';
import 'language/language.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //App controllers and cache have been initializing here
  await App.init();

  final themeController = Get.put(ThemeController());
  Future.delayed(
    10.milliseconds,
    () => runApp(
      GetMaterialApp(
        translations: Languages(),
        title: 'Shartflix',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        theme: themeController.lightTheme,
        routes: AppRoutes.routes,
      ),
    ),
  );
}
