import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shartflix/core/constant/radius.dart';

import '../../core/constant/color.dart';
import '../../core/constant/text_style.dart';
import '../base/base.dart';

class ThemeController extends BaseController {
  ThemeData get lightTheme => ThemeData(
    fontFamily: 'Poppins',
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: ColorConstants.primary,
      onPrimary: ColorConstants.primary,
      secondary: ColorConstants.secondary,
      onSecondary: ColorConstants.black,
      error: Colors.red,
      onError: Colors.red,
      surface: Colors.white,
      onSurface: Colors.white,
    ),
    textTheme: TextTheme(
      titleLarge: CustomTextStyles.titleLarge,
      titleMedium: CustomTextStyles.titleMedium,
      titleSmall: CustomTextStyles.titleSmall,
      bodyLarge: CustomTextStyles.bodyLarge,
      bodyMedium: CustomTextStyles.bodyMedium,
      bodySmall: CustomTextStyles.bodySmall,
      labelLarge: CustomTextStyles.labelLarge,
      labelMedium: CustomTextStyles.labelMedium,
      labelSmall: CustomTextStyles.labelSmall,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(ColorConstants.primary),
        foregroundColor: WidgetStateProperty.all(ColorConstants.primary),
        shadowColor: WidgetStateProperty.all(ColorConstants.primary),
        textStyle: WidgetStateProperty.all(
          Get.theme.textTheme.bodyLarge!.copyWith(
            color: Colors.white,
          ),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ShartflixRadius.buttonRadius),
          ),
        ),
      ),
    ),
  );

  @override
  void onInit() {
    builderId = 'themeController';
    super.onInit();
  }
}
