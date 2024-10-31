import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qualifacts_case/ui/palette/color_palette.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Color fontColor;
  final Color color;
  final Color borderColor;
  final Color errorBorderColor;
  final Color highlightBorderColor;
  final FontWeight? fontWeight;
  final Widget? prefix;
  final Widget? suffix;
  final double fontSize;
  final FontStyle? fontStyle;
  final bool obscureText;
  final bool autocorrect;

  final String? hint;

  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  final bool enabled;

  final bool autoFocus;
  final bool enableSuggestions;

  final TextInputAction? textInputAction;
  final TextInputType? textInputType;

  final double height;

  final bool readOnly;

  final VoidCallback? onTap;

  final List<TextInputFormatter>? inputFormatters;

  final double? radius;

  final TextAlign? textAlign;

  final Alignment? textAlignment;

  final TextAlignVertical? textAlignVertical;

  final int? maxLines;
  final int? minLines;
  final bool expands;

  final double? borderWidth;
  final bool? filled;
  final Color? fillColor;

  const AppTextField({
    super.key,
    this.height = 48,
    this.controller,
    this.focusNode,
    this.fontColor = Colors.grey,
    this.color = Colors.white,
    this.borderColor = Colors.grey,
    this.errorBorderColor = Colors.grey,
    this.highlightBorderColor = Colors.blue,
    this.fontWeight,
    this.prefix,
    this.suffix,
    this.fontSize = 16,
    this.fontStyle,
    this.obscureText = false,
    this.autocorrect = true,
    this.hint,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.autoFocus = false,
    this.textInputAction,
    this.textInputType,
    this.readOnly = false,
    this.onTap,
    this.inputFormatters,
    this.radius,
    this.textAlign,
    this.textAlignment,
    this.textAlignVertical,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.enableSuggestions = false,
    this.borderWidth,
    this.filled,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 8),
      borderSide: BorderSide(
        color: borderColor,
        width: borderWidth ?? 1,
      ),
    );
    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 8),
      borderSide: BorderSide(
        color: errorBorderColor,
        width: borderWidth ?? 1,
      ),
    );
    final inputHighlightBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 8),
      borderSide: BorderSide(
        color: highlightBorderColor,
        width: borderWidth ?? 2,
      ),
    );
    return SizedBox(
      height: height,
      child: Center(
        child: TextField(
          controller: controller,
          enabled: enabled,
          focusNode: focusNode,
          autocorrect: autocorrect,
          enableSuggestions: enableSuggestions,
          obscureText: obscureText,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          keyboardType: textInputType,
          autofocus: autoFocus,
          textInputAction: textInputAction,
          readOnly: readOnly,
          onTap: onTap,
          minLines: minLines,
          maxLines: maxLines,
          expands: expands,
          inputFormatters: inputFormatters,
          textAlign: textAlign ?? TextAlign.start,
          textAlignVertical: textAlignVertical,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight ?? FontWeight.w400,
            color: ColorsConstant.black,
            fontStyle: fontStyle,
            letterSpacing: .5,
          ),
          decoration: InputDecoration(
            hintText: hint,
            filled: filled,
            fillColor: fillColor,
            hintStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight ?? FontWeight.w400,
              color: Colors.grey,
              fontStyle: fontStyle,
              letterSpacing: .5,
            ),
            contentPadding: const EdgeInsets.all(12),
            border: inputBorder,
            errorBorder: errorBorder,
            disabledBorder: inputBorder,
            enabledBorder: inputBorder,
            focusedBorder: inputHighlightBorder,
            focusedErrorBorder: errorBorder,
            prefixIcon: prefix,
            suffixIcon: suffix,
          ),
        ),
      ),
    );
  }
}