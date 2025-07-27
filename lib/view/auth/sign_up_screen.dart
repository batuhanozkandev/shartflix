import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shartflix/bloc/auth_bloc/auth_state.dart';
import 'package:shartflix/core/constant/color.dart';
import 'package:shartflix/core/extention/numX.dart';
import 'package:shartflix/service/auth/auth.dart';
import 'package:shartflix/view/base/base_screen.dart';
import 'package:shartflix/widget/button/primary_button.dart';
import 'package:shartflix/widget/text/body/large.dart';
import 'package:shartflix/widget/text/title/small.dart';

import '../../bloc/auth_bloc/auth_bloc.dart';
import '../../bloc/auth_bloc/auth_event.dart';
import '../../routes/routes.dart';
import '../../widget/button/social_button.dart';
import '../../widget/input/input_field.dart';
import '../../widget/text/body/medium.dart';
import '../../widget/text/body/small.dart';

TextEditingController _nameSurnameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _rePasswordController = TextEditingController();

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => AuthBloc(),
      child: BaseScreen(
        mobile: Column(
          children: [
            8.yh,
            ShartComponentSmallTitle(text: 'Hoşgeldiniz'),
            1.yh,
            ShartComponentMediumBody(
              text:
                  'Tempus varius a vitae interdum id tortor elementum tristique eleifend at.',
            ),
            4.yh,
            ShartFlixInputField(
              controller: _nameSurnameController,
              hintText: 'Ad Soyad',
              prefixIcon: SvgPicture.asset(
                'assets/icons/auth/ic_add_user.svg',
                width: 16,
                height: 16,
                colorFilter: ColorFilter.mode(
                  Get.theme.colorScheme.secondary,
                  BlendMode.srcIn,
                ),
              ),
            ),
            2.yh,
            ShartFlixInputField(
              controller: _emailController,
              hintText: 'E-Posta',
              prefixIcon: SvgPicture.asset(
                'assets/icons/auth/ic_email.svg',
                width: 16,
                height: 16,
                colorFilter: ColorFilter.mode(
                  Get.theme.colorScheme.secondary,
                  BlendMode.srcIn,
                ),
              ),
            ),
            2.yh,
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) => ShartFlixInputField(
                controller: _passwordController,
                hintText: 'Şifre',
                isObscure: state.isPasswordObscured,
                prefixIcon: SvgPicture.asset(
                  'assets/icons/auth/ic_password.svg',
                  width: 16,
                  height: 16,
                  colorFilter: ColorFilter.mode(
                    Get.theme.colorScheme.secondary,
                    BlendMode.srcIn,
                  ),
                ),
                suffixIcon: GestureDetector(
                  onTap: () =>
                      context.read<AuthBloc>().add(TogglePasswordVisibility()),
                  child: SvgPicture.asset(
                    'assets/icons/auth/ic_hide_password.svg',

                    width: 16,
                    height: 16,
                    colorFilter: ColorFilter.mode(
                      Get.theme.colorScheme.secondary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
            2.yh,
            ShartFlixInputField(
              controller: _rePasswordController,
              hintText: 'Şifre Tekrar',
              prefixIcon: SvgPicture.asset(
                'assets/icons/auth/ic_password.svg',
                width: 16,
                height: 16,
                colorFilter: ColorFilter.mode(
                  Get.theme.colorScheme.secondary,
                  BlendMode.srcIn,
                ),
              ),
            ),
            4.yh,
            RichText(
              text: TextSpan(
                text: 'Kullanıcı sözleşmesini ',
                style: Get.theme.textTheme.bodySmall!.copyWith(
                  color: ColorConstants.darkText,
                ),
                children: [
                  TextSpan(
                    text: 'okudum ve kabul ediyorum.',
                    style: Get.theme.textTheme.bodySmall!.copyWith(
                      color: Get.theme.colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(
                    text: ' Bu sözelşmeyi okuyarak devam ediniz lütfen.',
                    style: Get.theme.textTheme.bodySmall!.copyWith(
                      color: ColorConstants.darkText,
                    ),
                  ),
                ],
              ),
            ),
            2.yh,
            ShartComponentPrimaryButton(
              height: 6.h,
              text: 'Şimdi Kaydol',
              onTap: () {
                if (_passwordController.text != _rePasswordController.text) {
                  Get.snackbar(
                    'Hata',
                    'Şifreler eşleşmiyor!',
                    backgroundColor: ColorConstants.error,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                  return;
                }
                AuthService.register(
                  email: _emailController.text,
                  name: _nameSurnameController.text,
                  password: _passwordController.text,
                );
              },
            ),
            4.yh,
            SocialRow(),
            4.yh,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShartComponentSmallBody(
                  text: 'Zaten bir hesabın var mı?',
                  isDark: true,
                ),
                1.xw,
                GestureDetector(
                  onTap: () => Get.offAndToNamed(AppPages.logInScreen),
                  child: ShartComponentSmallBody(
                    text: 'Giriş Yap!',
                    isBold: true,
                  ),
                ),
              ],
            ),
            2.yh,
          ],
        ),
      ),
    );
  }
}
