import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shartflix/core/constant/color.dart';
import 'package:shartflix/core/constant/padding.dart';
import 'package:shartflix/core/constant/radius.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shartflix/core/extention/numX.dart';

class ShartComponentBackButton extends StatelessWidget {
  const ShartComponentBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        padding: ShartflixPadding.buttonTextPadding,
        width: 12.w,
        height: 12.w,
        decoration: BoxDecoration(
          color: ColorConstants.buttonBackground,
          borderRadius: BorderRadius.circular(
            ShartflixRadius.buttonRadius * 200,
          ),
          border: Border.all(color: ColorConstants.borderColor, width: 1.0),
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/icons/ic_arrow_back.svg',
            colorFilter: ColorFilter.mode(
              ColorConstants.socialIconColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
