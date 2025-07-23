import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shartflix/core/constant/color.dart';
import 'package:shartflix/core/constant/radius.dart';
import 'package:shartflix/core/extention/numX.dart';
import 'package:shartflix/view/base/base_screen.dart';
import 'package:shartflix/widget/button/primary_button.dart';
import 'package:shartflix/widget/button/social_button.dart';
import 'package:shartflix/widget/text/body/medium.dart';
import 'package:shartflix/widget/text/body/small.dart';
import 'package:shartflix/widget/text/title/medium.dart';

import '../widget/button/add_button.dart';
import '../widget/button/back_button.dart';
import '../widget/button/bottom_nav_button.dart';
import '../widget/button/follow_button.dart';
import '../widget/button/primary_button_with_icon.dart';
import '../widget/text/body/large.dart';
import '../widget/text/title/large.dart';
import '../widget/text/title/small.dart';

class ComponentScreen extends StatelessWidget {
  const ComponentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      mobile: ListView(
        shrinkWrap: true,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: ShartComponentBackButton(),
          ),
          4.yh,
          ShartComponentLargeTitle(text: 'Large Title Text'),
          ShartComponentMediumTitle(text: 'Medium Title Text'),
          ShartComponentSmallTitle(text: 'Small Title Text'),
          ShartComponentLargeBody(text: 'Large Body Text'),
          ShartComponentLargeBody(text: 'Bold Large Body Text', isBold: true),
          ShartComponentLargeBody(
            text: 'Overlined Large Body Text',
            hasOverline: true,
          ),
          ShartComponentMediumBody(
            text: 'ThroughLined Large Body Text',
            hasThroughLine: true,
          ),
          ShartComponentSmallBody(
            text: 'Underlined Large Body Text',
            hasUnderline: true,
          ),
          ShartComponentMediumBody(text: 'Medium Body Text.'),
          ShartComponentSmallBody(text: 'Small Body Text'),
          4.yh,
          ShartComponentPrimaryButton(text: 'Primary Button', onTap: () {}),
          4.yh,
          SocialRow(),
          4.yh,
          ShartComponentAddButton(),
          4.yh,
          ShartComponentFollowButton(onTap: () {}),
          4.yh,
          SizedBox(
            width: 28.w,
            height: 4.h,
            child: ShartComponentPrimaryButtonWithIcon(
              text: 'Sınırlı Teklif',
              onTap: () {},
              iconPath: 'assets/icons/ic_diamond.svg',
            ),
          ),
          4.yh,
          ShartBottomNavBar(),
          20.yh,
        ],
      ),
    );
  }
}
