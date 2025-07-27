import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:shartflix/core/extention/numX.dart';

import '../../core/constant/color.dart';
import '../../core/constant/padding.dart';
import '../../core/constant/radius.dart';
import '../bonus/bonus_row.dart';
import '../button/primary_button.dart';
import '../text/body/medium.dart';
import '../text/body/small.dart';
import '../text/title/small.dart';

class Offer extends StatelessWidget {
  const Offer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: Stack(
        children: [
          Container(
            width: 100.w,
            padding: ShartflixPadding.buttonTextPadding,
            decoration: BoxDecoration(
              color: ColorConstants.background,
              borderRadius: BorderRadius.circular(
                ShartflixRadius.buttonRadius,
              ),
            ),
            child: Padding(
              padding: 4.w.pH,
              child: Column(
                children: [
                  ShartComponentSmallTitle(text: 'Sınırlı Teklif'),
                  Padding(
                    padding: 4.w.pH,
                    child: ShartComponentSmallBody(
                      text:
                      'Jeton paketin’ni seçerek bonus\n kazanın ve yeni bölümlerin kilidini açın!',
                    ),
                  ),
                  4.yh,
                  BlurryContainer(
                    blur: 5,
                    width: 92.w,
                    height: 20.h,
                    elevation: 0,
                    color: Colors.white.withValues(alpha: 0.1),
                    padding: const EdgeInsets.all(8),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ShartComponentMediumBody(
                          text: 'Alacağınız Bonuslar',
                        ),
                        2.yh,
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                          children: [
                            _BonusWidget(
                              type: BonusType.diamond,
                              text: 'Premium Hesap',
                            ),
                            _BonusWidget(
                              type: BonusType.hearts,
                              text: 'Daha Fazla Eşleşme',
                            ),
                            _BonusWidget(
                              type: BonusType.up,
                              text: 'Öne Çıkarma',
                            ),
                            _BonusWidget(
                              type: BonusType.heart,
                              text: 'Daha Fazla Beğeni',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  2.yh,
                  ShartComponentMediumBody(
                    text: 'Kilidi açmak için bir jeton paketi seçin',
                  ),
                  2.yh,
                  BonusRow(),
                  4.yh,
                  ShartComponentPrimaryButton(
                    height: 6.h,
                    text: 'Tüm Jetonları Gör',
                    onTap: null,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -5.h,
            left: 0,
            right: 0,
            child: Container(
              height: 32.h,
              width: 32.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: ColorConstants.bgCircleRedColor.withValues(
                      alpha: 0.2,
                    ),
                    blurRadius: 70,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -20.h,
            left: 0,
            right: 0,
            child: Container(
              height: 32.h,
              width: 32.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: ColorConstants.bgCircleRedColor.withValues(
                      alpha: 0.4,
                    ),
                    blurRadius: 70,
                    offset: Offset(0, 0),
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


class _BonusWidget extends StatelessWidget {
  const _BonusWidget({super.key, required this.type, required this.text});

  final BonusType type;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16.w,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/images/img_bg_bonus.png'),
              Image.asset('assets/icons/bonus/ic_bonus_${type.name}.png'),
            ],
          ),
          1.yh,
          ShartComponentSmallBody(text: text, maxLines: 2),
        ],
      ),
    );
  }
}

enum BonusType { diamond, heart, hearts, up }