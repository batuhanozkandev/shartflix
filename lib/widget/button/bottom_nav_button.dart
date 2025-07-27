import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/core/constant/color.dart';
import 'package:shartflix/core/constant/radius.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shartflix/core/extention/numX.dart';
import 'package:shartflix/widget/text/body/small.dart';

import '../../bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import '../../bloc/bottom_nav_bar/bottom_nav_bar_event.dart';

class _ShartComponentBottomNavButton extends StatelessWidget {
  const _ShartComponentBottomNavButton({super.key, this.onTap, required this.text, required this.iconPath});

  final VoidCallback? onTap;
  final String text;
  final PageType iconPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: 2.w.pH,
        width: 32.w,
        height: 10.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            ShartflixRadius.buttonRadius * 200,
          ),
          border: Border.all(color: ColorConstants.borderColor, width: 1.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              'assets/icons/ic_${iconPath.name}.svg',
              colorFilter: ColorFilter.mode(
                ColorConstants.white,
                BlendMode.srcIn,
              ),
            ),
            ShartComponentSmallBody(text: text),
          ],
        )
      ),
    );
  }
}

enum PageType {
  login,
  register,
  home,
  explore,
  profile,
}


class ShartBottomNavBar extends StatelessWidget {
  const ShartBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      width: 100.w,
      decoration: BoxDecoration(
          color: ColorConstants.background,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
              ShartflixRadius.bottomNavBarRadius,
            ),
            bottomRight: Radius.circular(
              ShartflixRadius.bottomNavBarRadius,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: ColorConstants.buttonBackground,
              blurRadius: 4.0,
              offset: const Offset(0, -1),
            ),
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ShartComponentBottomNavButton(
            onTap: () => context.read<BottomNavBarBloc>().add(BottomNavBarRouteTo(0)),
            text: 'Anasayfa',
            iconPath: PageType.home,
          ),
          _ShartComponentBottomNavButton(
            onTap: () => context.read<BottomNavBarBloc>().add(BottomNavBarRouteTo(1)),
            text: 'Profil',
            iconPath: PageType.profile,
          ),
        ],
      ),
    );
  }
}
