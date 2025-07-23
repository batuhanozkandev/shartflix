import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShartComponentSmallText extends StatelessWidget {
  const ShartComponentSmallText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Get.theme.textTheme.titleSmall?.copyWith(
        fontWeight: FontWeight.bold,
        color: Get.theme.colorScheme.secondary,
      ),
      textAlign: TextAlign.center,
    );
  }
}
