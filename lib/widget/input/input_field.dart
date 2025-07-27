import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shartflix/core/constant/radius.dart';
import 'package:shartflix/core/extention/numX.dart';

import '../../core/constant/color.dart';

class ShartFlixInputField extends StatelessWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isObscure;
  final String? initialValue;
  final void Function(String)? onChanged;
  final Color? errorColor;
  final Color? inputTextColor;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final double? maxHeight;
  final double? maxWidth;

  const ShartFlixInputField({
    super.key,
    this.hintText,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.isObscure = false,
    this.initialValue,
    this.onChanged,
    this.errorColor,
    this.inputTextColor,
    this.prefixIcon,
    this.textInputType,
    this.inputFormatters,
    this.maxHeight,
    this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.disabled,
      inputFormatters: inputFormatters ?? [],
      controller: controller,
      keyboardType: textInputType ?? TextInputType.text,
      initialValue: initialValue,
      cursorHeight: 20,
      style: Get.theme.textTheme.bodyLarge!
          .copyWith(color: inputTextColor ?? ColorConstants.white),
      cursorColor: Get.theme.secondaryHeaderColor,
      obscureText: isObscure!,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null ? Container(
            margin: EdgeInsets.only(left: 6.w, right: 2.w),
            child: prefixIcon) : null,
        prefixIconConstraints: BoxConstraints(maxHeight: 7.w),
        suffixIcon:  suffixIcon != null ? Container(
            margin: EdgeInsets.only(right: 5.w),
            child: suffixIcon) : null,
        suffixIconConstraints: BoxConstraints(maxHeight: 7.w),
        hintText: hintText,
        fillColor: ColorConstants.buttonBackground,
        filled: true,
        hintStyle: Get.theme.textTheme.bodyLarge!.copyWith(
          color: inputTextColor ?? ColorConstants.buttonBackground,
        ),
        constraints: BoxConstraints(
          maxHeight: maxHeight ?? 20.h,
          maxWidth: maxWidth ?? 100.w,
        ),
        contentPadding: 10.pAll.add(3.w.pH).add(2.w.pV),
        enabledBorder: shartFlixBorder,
        border: shartFlixBorder,
        focusedBorder: shartFlixBorder,
        errorStyle: Get.theme.textTheme.labelSmall!.copyWith(
          color: Get.theme.colorScheme.secondary.withOpacity(0.8),
        ),
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}

InputBorder shartFlixBorder = OutlineInputBorder(
  borderSide:  BorderSide(
      color: ColorConstants.borderColor, width: 1.0,
  ),
  borderRadius: BorderRadius.circular(ShartflixRadius.inputFieldRadius),
);
