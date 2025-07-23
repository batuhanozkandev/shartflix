import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shartflix/core/extention/numX.dart';
import 'package:shartflix/view/base/base_screen.dart';
import 'package:shartflix/widget/button/primary_button.dart';
import 'package:shartflix/widget/button/social_button.dart';

import '../widget/button/add_button.dart';
import '../widget/button/back_button.dart';
import '../widget/button/follow_button.dart';

class ComponentScreen extends StatelessWidget {
  const ComponentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(mobile: _Mobile());
  }
}

class _Mobile extends StatelessWidget {
  const _Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 92.w,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: ShartComponentBackButton(),
              ),
              4.yh,
              ShartComponentPrimaryButton(text: 'Primary Button', onTap: () {}),
              4.yh,
              SocialRow(),
              4.yh,
              ShartComponentAddButton(),
              4.yh,
              ShartComponentFollowButton(onTap: () {}),
            ],
          ),
        ),
      ],
    );
  }
}
