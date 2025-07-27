import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shartflix/bloc/auth_bloc/auth_state.dart';
import 'package:shartflix/core/extention/numX.dart';
import 'package:shartflix/routes/routes.dart';
import 'package:shartflix/service/auth/auth.dart';
import 'package:shartflix/view/base/base_screen.dart';
import 'package:shartflix/widget/button/primary_button.dart';
import 'package:shartflix/widget/text/title/small.dart';

import '../../bloc/auth_bloc/auth_bloc.dart';
import '../../bloc/auth_bloc/auth_event.dart';
import '../../widget/button/social_button.dart';
import '../../widget/input/input_field.dart';
import '../../widget/text/body/medium.dart';
import '../../widget/text/body/small.dart';

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => AuthBloc(),
      child: BaseScreen(
        mobile: Column(
          children: [
            28.yh,
            ShartComponentSmallTitle(text: 'Merhabalar'),
            1.yh,
            ShartComponentMediumBody(
              text:
                  'Tempus varius a vitae interdum id tortor elementum tristique eleifend at.',
            ),
            4.yh,
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
              builder: (context, state) {
                return ShartFlixInputField(
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
                    onTap: () => context.read<AuthBloc>().add(
                      TogglePasswordVisibility(),
                    ),
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
                );
              },
            ),
            4.yh,
            Align(
              alignment: Alignment.centerLeft,
              child: ShartComponentSmallBody(
                text: 'Şifremi Unuttum',
                hasUnderline: true,
                isBold: true,
              ),
            ),
            2.yh,
            ShartComponentPrimaryButton(
              height: 6.h,
              text: 'Giriş Yap',
              onTap: () async {
                await AuthService.logIn(
                  email: _emailController.text,
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
                  text: 'Bir hesabın yok mu?',
                  isDark: true,
                ),
                1.xw,
                GestureDetector(
                  onTap: () => Get.offAndToNamed(AppPages.signUpScreen),
                  child: ShartComponentSmallBody(
                    text: 'Kayıt Ol',
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
