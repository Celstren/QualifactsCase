import 'package:flutter/material.dart';
import 'package:qualifacts_case/ui/app_text/app_text.dart';
import 'package:qualifacts_case/ui/palette/color_palette.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final double fontSize;
  final Color color;
  final Color hoveredColor;
  final Color pressedColor;
  final Color? fontColor;
  final Color? disabledColor;
  final Color? disabledFontColor;
  final double radius;
  final EdgeInsets padding;

  const AppButton({
    super.key,
    this.text = '',
    this.onTap,
    this.fontSize = 16,
    this.color = ColorsConstant.moonstone,
    this.hoveredColor = ColorsConstant.moonstone,
    this.pressedColor = ColorsConstant.moonstone,
    this.fontColor = ColorsConstant.white,
    this.disabledColor = Colors.grey,
    this.disabledFontColor = Colors.grey,
    this.radius = 8,
    this.padding = const EdgeInsets.all(12),
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: onTap != null ? Colors.white : Colors.grey,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
      ).copyWith(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return disabledColor ?? Colors.grey;
            }
            if (states.contains(WidgetState.hovered)) {
              return hoveredColor;
            }
            if (states.contains(WidgetState.pressed)) {
              return pressedColor;
            }
            return color;
          },
        ),
      ),
      child: Padding(
        padding: padding,
        child: AppText.semiBold(
          text,
          textAlign: TextAlign.center,
          fontSize: fontSize,
          fontColor: onTap != null
              ? (fontColor ?? Colors.white)
              : (disabledFontColor ?? Colors.black12),
          maxLines: null,
        ),
      ),
    );
  }
}
