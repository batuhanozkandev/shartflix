import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shartflix/core/constant/radius.dart';
import 'package:shartflix/core/extention/numX.dart';
import 'package:shartflix/widget/button/follow_button.dart';
import 'package:shartflix/widget/text/body/large.dart';
import 'package:shartflix/widget/text/body/small.dart';
import 'package:shartflix/widget/text/title/large.dart';

import '../../core/constant/color.dart';

class ExploreCard extends StatelessWidget {
  const ExploreCard({
    super.key,
    this.imageUrl,
    this.logoUrl,
    this.title,
    this.subtitle,
  });

  final String? imageUrl;
  final String? logoUrl;
  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Stack(
        children: [
          Positioned.fill(
            child: imageUrl != null
                ? Image.network(imageUrl!, fit: BoxFit.cover)
                : Image.asset(
                    'assets/images/img_logo_sinflix.png',
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    ColorConstants.black.withValues(alpha: 0.8),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 12.h,
            left: 8.w,
            child: SizedBox(
              width: 84.w,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: ShartComponentFollowButton(
                      onTap: () {},
                      isLiked: true,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 5.h,
                        width: 5.h,
                        child: logoUrl != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(1000),
                                child: Image.network(
                                  logoUrl!,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(1000),
                                child: Image.asset(
                                  'assets/images/img_logo_sinflix.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                      2.xw,
                      SizedBox(
                        width: 52.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (title != null)
                              ShartComponentLargeBody(
                                text: title!,
                                isBold: true,
                              ),
                            if (subtitle != null)
                              RichText(
                                text: TextSpan(
                                  text: subtitle,
                                  style: Get.theme.textTheme.bodySmall!
                                      .copyWith(color: ColorConstants.darkText),
                                  children: [
                                    TextSpan(
                                      text: ' Daha Fazlası',
                                      style: Get.theme.textTheme.bodySmall!
                                          .copyWith(
                                            color:
                                                Get.theme.colorScheme.secondary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
