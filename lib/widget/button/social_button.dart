import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shartflix/core/constant/color.dart';
import 'package:shartflix/core/constant/padding.dart';
import 'package:shartflix/core/constant/radius.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shartflix/core/extention/numX.dart';

class _ShartComponentSocialButton extends StatelessWidget {
  const _ShartComponentSocialButton({
    super.key,
    required this.type,
    required this.onTap,
  });

  final SocialType type;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: ShartflixPadding.buttonTextPadding,
        width: 16.w,
        height: 16.w,
        decoration: BoxDecoration(
          color: ColorConstants.buttonBackground,
          borderRadius: BorderRadius.circular(ShartflixRadius.buttonRadius),
          border: Border.all(color: ColorConstants.borderColor, width: 1.0),
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/icons/social/ic_${type.name}.svg',
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

class SocialRow extends StatelessWidget {
  const SocialRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ShartComponentSocialButton(type: SocialType.google, onTap: () {}),
          _ShartComponentSocialButton(type: SocialType.apple, onTap: () {}),
          _ShartComponentSocialButton(type: SocialType.facebook, onTap: () {}),
        ],
      ),
    );
  }
}

enum SocialType { facebook, google, apple }
