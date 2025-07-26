
import 'package:flutter/material.dart';
import 'package:shartflix/core/extention/numX.dart';

import '../button/back_button.dart';
import '../button/primary_button_with_icon.dart';
import '../text/body/large.dart';

class ShartAppBar extends StatelessWidget {
  const ShartAppBar({super.key, this.isActiveLimitedOfferButton = false});

  final bool? isActiveLimitedOfferButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 12.w,
      width: 92.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(left: 0, child: ShartComponentBackButton()),
          ShartComponentLargeBody(text: 'Profil Detayı'),
          isActiveLimitedOfferButton!
              ? Positioned(
            right: 0,
            child: SizedBox(
              height: 3.h,
              width: 24.w,
              child: ShartComponentPrimaryButtonWithIcon(
                text: 'Sınırlı Teklif',
                onTap: () {},
                iconPath: 'assets/icons/ic_diamond.svg',
              ),
            ),
          )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
