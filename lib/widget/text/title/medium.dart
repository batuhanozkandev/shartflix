import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShartComponentMediumTitle extends StatelessWidget {
  const ShartComponentMediumTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Get.theme.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: Get.theme.colorScheme.secondary,
      ),
      textAlign: TextAlign.center,
    );
  }
}
