import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shartflix/routes/routes.dart';
import 'package:shartflix/view/auth/log_in_screen.dart';
import 'package:shartflix/view/components.dart';
import 'package:shartflix/view/main/main_screen.dart';

import 'controller/theme/theme.dart';
import 'helper/app.dart';
import 'language/language.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //App controllers and cache have been initializing here
  await App.init();

  final themeController = Get.put(ThemeController());
  bool hasToken = App.hasToken();
  print('Has Token : $hasToken');
  Future.delayed(
    10.milliseconds,
        () => runApp(
      GetMaterialApp(
        translations: Languages(),
        title: 'Shartflix',
        debugShowCheckedModeBanner: false,
        home: LogInScreen(),
        //hasToken ? const MainScreen() : const WelcomeScreen(),
        theme: themeController.lightTheme,
        routes: AppRoutes.routes,
      ),
    ),
  );
}
