import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shartflix/routes/routes.dart';
import 'package:shartflix/view/splash/splash_screen.dart';

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
