import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shartflix/core/constant/color.dart';

class ShartComponentSmallBody extends StatelessWidget {
  const ShartComponentSmallBody({
    super.key,
    required this.text,
    this.isBold = false,
    this.hasUnderline = false,
    this.isItalic = false,
    this.hasThroughLine = false,
    this.hasOverline = false,
    this.maxLines,
    this.isDark = false,
  });

  final String text;
  final bool? isBold;
  final bool? isDark;
  final bool? hasUnderline;
  final bool? hasThroughLine;
  final bool? hasOverline;
  final bool? isItalic;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    TextStyle? style = Get.theme.textTheme.bodySmall?.copyWith(
      color: isDark!
          ? ColorConstants.darkText
          : Get.theme.colorScheme.secondary,
      fontWeight: isBold! ? FontWeight.bold : FontWeight.normal,
      decoration: hasUnderline!
          ? TextDecoration.underline
          : hasThroughLine!
          ? TextDecoration.lineThrough
          : hasOverline!
          ? TextDecoration.overline
          : TextDecoration.none,
      fontStyle: isItalic! ? FontStyle.italic : FontStyle.normal,
    );
    return Text(
      text,
      style: style,
      textAlign: TextAlign.center,
      maxLines: maxLines,
    );
  }
}
