import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shartflix/core/extention/numX.dart';
import 'package:shartflix/view/base/base_screen.dart';
import 'package:shartflix/widget/app_bar/app_bar.dart';
import 'package:shartflix/widget/button/primary_button.dart';
import 'package:shartflix/widget/text/title/small.dart';

import '../../widget/button/add_button.dart';
import '../../widget/text/body/medium.dart';

class AddProfilePhotoScreen extends StatelessWidget {
  const AddProfilePhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      mobile: SizedBox(
        height: 88.h,
        child: Column(
          children: [
            ShartAppBar(),
            4.yh,
            ShartComponentSmallTitle(text: 'Fotoğraflarınızı Yükleyin'),
            2.yh,
            Padding(
              padding: 12.w.pH,
              child: ShartComponentMediumBody(
                text: 'Resources out incentivize relaxation floor loss cc.',
              ),
            ),
            4.yh,
            ShartComponentAddButton(),
            Spacer(),
            ShartComponentPrimaryButton(text: 'Devam Et', onTap: () => Get.back()),
          ],
        ),
      ),
    );
  }
}
