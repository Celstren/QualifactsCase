import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double fontSize;
  final Color? fontColor;
  final TextAlign? textAlign;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final int? maxLines;
  final double? letterSpacing;
  final bool softWrap;
  final TextOverflow? overFlow;

  const AppText.light(
      this.text, {
        super.key,
        this.fontWeight = FontWeight.w300,
        this.fontSize = 12,
        this.fontColor,
        this.textAlign,
        this.fontStyle,
        this.decoration,
        this.decorationColor,
        this.maxLines,
        this.letterSpacing,
        this.softWrap = true,
        this.overFlow,
      });

  const AppText.normal(
      this.text, {
        super.key,
        this.fontWeight = FontWeight.w400,
        this.fontSize = 12,
        this.fontColor,
        this.textAlign,
        this.fontStyle,
        this.decoration,
        this.decorationColor,
        this.maxLines,
        this.letterSpacing,
        this.softWrap = true,
        this.overFlow,
      });

  const AppText.medium(
      this.text, {
        super.key,
        this.fontWeight = FontWeight.w500,
        this.fontSize = 12,
        this.fontColor,
        this.textAlign,
        this.fontStyle,
        this.decoration,
        this.decorationColor,
        this.maxLines,
        this.letterSpacing,
        this.softWrap = true,
        this.overFlow,
      });

  const AppText.semiBold(
      this.text, {
        super.key,
        this.fontWeight = FontWeight.w600,
        this.fontSize = 12,
        this.fontColor,
        this.textAlign,
        this.fontStyle,
        this.decoration,
        this.decorationColor,
        this.maxLines,
        this.letterSpacing,
        this.softWrap = true,
        this.overFlow,
      });

  const AppText.bold(
      this.text, {
        super.key,
        this.fontWeight = FontWeight.w700,
        this.fontSize = 12,
        this.fontColor,
        this.textAlign,
        this.fontStyle,
        this.decoration,
        this.decorationColor,
        this.maxLines,
        this.letterSpacing,
        this.softWrap = true,
        this.overFlow,
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        color: fontColor,
        fontSize: fontSize,
        fontStyle: fontStyle,
        decoration: decoration,
        decorationColor: decorationColor,
        overflow: TextOverflow.clip,
        letterSpacing: letterSpacing,
      ),
      overflow: overFlow,
      softWrap: softWrap,
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
