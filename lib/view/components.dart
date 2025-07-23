import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shartflix/core/extention/numX.dart';
import 'package:shartflix/view/base/base_screen.dart';
import 'package:shartflix/widget/button/primary_button.dart';

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
              12.yh,
              ShartComponentPrimaryButton(text: 'Primary Button', onTap: () {}),
            ],
          ),
        ),
      ],
    );
  }
}
