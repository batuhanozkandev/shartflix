import 'package:flutter/material.dart';

class CustomTextStyles {
  static TextStyle get titleLarge => const TextStyle(fontSize: 40);

  static TextStyle get titleMedium => titleLarge.copyWith(fontSize: 24);

  static TextStyle get titleSmall => titleLarge.copyWith(fontSize: 20);

  static TextStyle get bodyLarge => const TextStyle(fontSize: 18);

  static TextStyle get bodyMedium => bodyLarge.copyWith(fontSize: 16);

  static TextStyle get bodySmall => bodyLarge.copyWith(fontSize: 12);

  static TextStyle get labelLarge => const TextStyle(fontSize: 8);

  static TextStyle get labelMedium => labelLarge.copyWith(fontSize: 4);

  static TextStyle get labelSmall => labelLarge.copyWith(fontSize: 2);
}
