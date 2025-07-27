import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shartflix/core/constant/radius.dart';
import 'package:shartflix/widget/text/body/medium.dart';

class ShartComponentPrimaryButton extends StatelessWidget {
  const ShartComponentPrimaryButton({
    super.key,
    required this.text,
    this.onTap, this.height, this.width,
  });

  final String text;
  final VoidCallback? onTap;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(ShartflixRadius.buttonRadius),
        ),
        child: Center(
          child: ShartComponentMediumBody(text: text, isBold: true,),
        ),
      ),
    );
  }
}
