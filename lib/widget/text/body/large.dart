import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShartComponentLargeBody extends StatelessWidget {
  const ShartComponentLargeBody({
    super.key,
    required this.text,
    this.isBold = false,
    this.hasUnderline = false,
    this.isItalic = false,
    this.hasThroughLine = false,
    this.hasOverline = false,
  });

  final String text;
  final bool? isBold;
  final bool? hasUnderline;
  final bool? hasThroughLine;
  final bool? hasOverline;
  final bool? isItalic;

  @override
  Widget build(BuildContext context) {
    TextStyle? style = Get.theme.textTheme.bodyLarge?.copyWith(
      color: Get.theme.colorScheme.secondary,
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
    return Text(text, style: style, textAlign: TextAlign.center);
  }
}
