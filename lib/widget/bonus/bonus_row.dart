import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shartflix/core/extention/numX.dart';

import '../../core/constant/color.dart';
import '../../core/constant/radius.dart';
import '../text/body/medium.dart';
import '../text/body/small.dart';
import '../text/title/small.dart';

class BonusRow extends StatelessWidget {
  const BonusRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 92.w,
      child: Row(
        children: [
          Expanded(
            child: _OfferBox(data: OfferData(200, 330, 99.99, percent: '%10')),
          ),
          4.xw,
          Expanded(
            child: _OfferBox(
              data: OfferData(200, 330, 99.99, percent: '%10'),
              isPopular: true,
            ),
          ),
          4.xw,
          Expanded(
            child: _OfferBox(data: OfferData(200, 330, 99.99, percent: '%10')),
          ),
        ],
      ),
    );
  }
}

class _OfferBox extends StatelessWidget {
  const _OfferBox({super.key, this.isPopular = false, required this.data});

  final bool? isPopular;
  final OfferData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 24.h,
              decoration: BoxDecoration(
                color: isPopular!
                    ? Color(0xFF5949E6)
                    : Get.theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(ShartflixRadius.cardRadius),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: 4.w.pV,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 2.h,
                            padding: 10.pH,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(
                                ShartflixRadius.cardRadius,
                              ),
                            ),
                            child: SizedBox(),
                          ),
                          Column(
                            children: [
                              ShartComponentSmallBody(
                                text: data.oldJetonCount.toString(),
                                hasThroughLine: true,
                              ),
                              ShartComponentSmallTitle(
                                text: data.oldJetonCount.toString(),
                              ),
                              ShartComponentSmallBody(text: 'Jeton'),
                            ],
                          ),
                          Column(
                            children: [
                              Divider(
                                color: Colors.white,
                                thickness: 0.2,
                                indent: 20,
                                endIndent: 20,
                              ),
                              ShartComponentMediumBody(
                                text: '₺${data.price}',
                                isBold: true,
                              ),
                              ShartComponentSmallBody(text: 'Başına Haftalık'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 6.w,
            right: 6.w,
            child: Container(
              height: 2.h,
              padding: 10.pH,
              decoration: BoxDecoration(
                color: isPopular!
                    ? Color(0xFF5949E6)
                    : Get.theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(ShartflixRadius.cardRadius),
                border: Border.all(color: ColorConstants.borderColor, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: ColorConstants.white.withValues(alpha: 0.5),
                    blurRadius: 3,
                    spreadRadius: 2,
                    offset: Offset(0, 0),
                    blurStyle: BlurStyle.inner,
                  ),
                ],
              ),
              child: ShartComponentSmallBody(text: '${data.percent}%'),
            ),
          ),
        ],
      ),
    );
  }
}

class OfferData {
  final String percent;
  final int oldJetonCount;
  final int newJetonCount;
  final double price;

  OfferData(
    this.oldJetonCount,
    this.newJetonCount,
    this.price, {
    required this.percent,
  });
}
