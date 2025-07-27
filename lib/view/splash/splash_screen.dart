import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:shartflix/core/extention/numX.dart';
import 'package:shartflix/routes/routes.dart';

import '../../helper/app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    bool hasToken = App.hasToken();

    Timer(const Duration(seconds: 2), () {
      Get.offAndToNamed(
        !hasToken ? AppPages.mainScreen : AppPages.logInScreen,
      ); // ya da '/home'
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: Image.asset(
            'assets/images/img_splash_sinflix.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
