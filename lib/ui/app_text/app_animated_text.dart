import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AppAnimatedText extends StatelessWidget {
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

  const AppAnimatedText.light(
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

  const AppAnimatedText.normal(
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

  const AppAnimatedText.medium(
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

  const AppAnimatedText.semiBold(
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

  const AppAnimatedText.bold(
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
    return AnimatedTextKit(
      totalRepeatCount: 1,
      isRepeatingAnimation: false,
      animatedTexts: <AnimatedText>[
        TypewriterAnimatedText(
          text,
          textStyle: TextStyle(
            fontWeight: fontWeight,
            color: fontColor,
            fontSize: fontSize,
            fontStyle: fontStyle,
            decoration: decoration,
            decorationColor: decorationColor,
            overflow: TextOverflow.clip,
            letterSpacing: letterSpacing,
          ),
          textAlign: textAlign ?? TextAlign.start,
          speed: const Duration(milliseconds: 50),
        ),
      ],
    );
  }
}
