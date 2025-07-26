import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shartflix/core/constant/color.dart';
import 'package:shartflix/core/extention/numX.dart';
import '../../core/constant/padding.dart';
import '../../widget/loader/loader.dart';
import '../../responsive/responsive.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({
    Key? key,
    this.hasAppBar = false,
    this.customAppBar,
    this.hasScrollable = false,
    this.safeArea = true,
    this.isLoading = false,
    this.customLoader,
    required this.mobile,
    this.tablet,
    this.desktop,
    this.watch,
    this.hasBottomNavBar = true,
    this.hasDefaultScreenPadding = true,
    this.onTopSuffix,
  }) : super(key: key);

  //
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;
  final Widget? watch;
  final bool? hasBottomNavBar;

  //

  final bool? hasAppBar;
  final Widget? customAppBar;
  final bool? hasScrollable;
  final bool? safeArea;
  final bool? hasDefaultScreenPadding;
  final bool? isLoading;
  final Widget? customLoader;
  final void Function()? onTopSuffix;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      backgroundColor: ColorConstants.background,
      extendBody: true,
      body: Stack(
        children: [
          safeArea!
              ? SafeArea(
              child: ListView(
                physics: hasScrollable!
                    ? const AlwaysScrollableScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                children: [
                  _Body(
                      hasDefaultScreenPadding: hasDefaultScreenPadding!,
                      customAppBar: customAppBar,
                      hasAppBar: hasAppBar,
                      onTopSuffix: onTopSuffix,
                      child: ShartflixResponsive(
                        mobile: mobile,
                      )),
                ],
              ))
              : ListView(
            padding: EdgeInsets.zero,
            physics: hasScrollable!
                ? const AlwaysScrollableScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            children: [
              _Body(
                hasDefaultScreenPadding: hasDefaultScreenPadding!,
                customAppBar: customAppBar,
                hasAppBar: hasAppBar,
                onTopSuffix: onTopSuffix,
                child: ShartflixResponsive(
                  mobile: mobile,
                ),
              ),
            ],
          ),
          if (isLoading!) customLoader ?? const FullScreenLoader(),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.customAppBar,
    required this.hasAppBar,
    required this.child,
    this.hasDefaultScreenPadding = true,
    this.onTopSuffix,
  });

  final Widget? customAppBar;
  final bool? hasAppBar;
  final bool? hasDefaultScreenPadding;
  final Widget child;
  final void Function()? onTopSuffix;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customAppBar != null
            ? customAppBar!
            : hasAppBar!
            ? Container(
          height: 6.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: Get.theme.colorScheme.primary,
          ),
          child: Stack(
            children: [
            ],
          ),
        )
            : const SizedBox(),
        Padding(
          padding: hasDefaultScreenPadding!
              ? ShartflixPadding.screenHorizontalPadding
              : EdgeInsets.zero,
          child: child,
        ),
      ],
    );
  }
}

class EpplyAppBar extends StatelessWidget {
  const EpplyAppBar({
    super.key,
    this.leadingWidget,
    this.suffixWidget,
  });

  final Widget? leadingWidget;
  final Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.h,
      width: 100.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leadingWidget ?? const SizedBox(),
          suffixWidget ?? const SizedBox(),
        ],
      ),
    );
  }
}
