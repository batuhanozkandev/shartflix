import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shartflix/core/constant/padding.dart';
import 'package:shartflix/core/constant/radius.dart';
import 'package:shartflix/widget/text/body/medium.dart';

class ShartComponentPrimaryButton extends StatelessWidget {
  const ShartComponentPrimaryButton({
    super.key,
    required this.text,
    this.onTap,
  });

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: ShartflixPadding.buttonTextPadding,
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(ShartflixRadius.buttonRadius),
        ),
        child: Center(
          child: ShartComponentMediumBody(text: text),
        ),
      ),
    );
  }
}
