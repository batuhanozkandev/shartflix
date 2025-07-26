import 'package:flutter/material.dart';
import 'package:shartflix/core/constant/color.dart';
import 'package:shartflix/core/constant/radius.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shartflix/core/extention/numX.dart';

class ShartComponentFollowButton extends StatelessWidget {
  const ShartComponentFollowButton({
    super.key,
    required this.onTap,
    this.isLiked = false,
  });

  final VoidCallback onTap;
  final bool isLiked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 12.w,
        height: 16.w,
        decoration: BoxDecoration(
          color: ColorConstants.buttonBackground,
          borderRadius: BorderRadius.circular(ShartflixRadius.buttonRadius * 2),
          border: Border.all(color: ColorConstants.borderColor, width: 1.0),
        ),
        child: Center(
          child: isLiked
              ? SvgPicture.asset(
                  'assets/icons/ic_follow.svg',
                  colorFilter: ColorFilter.mode(
                    ColorConstants.socialIconColor,
                    BlendMode.srcIn,
                  ),
                )
              : SvgPicture.asset(
                  'assets/icons/ic_follow.svg',
                  colorFilter: ColorFilter.mode(
                    ColorConstants.socialIconColor.withValues(alpha: 0.2),
                    BlendMode.srcIn,
                  ),
                ),
        ),
      ),
    );
  }
}
