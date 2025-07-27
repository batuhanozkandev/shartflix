import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shartflix/core/constant/padding.dart';
import 'package:shartflix/core/constant/radius.dart';
import 'package:shartflix/widget/text/body/small.dart';

class ShartComponentPrimaryButtonWithIcon extends StatelessWidget {
  const ShartComponentPrimaryButtonWithIcon({
    super.key,
    required this.text,
    this.onTap,
    required this.iconPath,
  });

  final String text;
  final String iconPath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: ShartflixPadding.buttonTextPadding /6,
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(ShartflixRadius.buttonRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 16,
              height: 16,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            ShartComponentSmallBody(text: text),
          ],
        ),
      ),
    );
  }
}
