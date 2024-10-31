import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qualifacts_case/ui/app_text/app_text.dart';
import 'package:qualifacts_case/ui/app_text_field/app_text_field.dart';
import 'package:qualifacts_case/ui/palette/color_palette.dart';

class AppLabeledTextField extends StatelessWidget {
  final String label;
  final String hint;
  final String error;
  final bool enabled;
  final bool readOnly;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  const AppLabeledTextField({
    super.key,
    this.label = '',
    this.hint = '',
    this.error = '',
    this.enabled = true,
    this.readOnly = false,
    this.controller,
    this.textInputType,
    this.onSubmitted,
    this.onChanged,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        AppText.medium(
          label,
          textAlign: TextAlign.left,
          fontSize: 16,
          fontColor: enabled ? ColorsConstant.black : Colors.grey,
        ),
        const SizedBox(height: 8),
        AppTextField(
          controller: controller,
          borderWidth: error.isNotEmpty ? 2 : null,
          hint: hint,
          textInputType: textInputType,
          onSubmitted: onSubmitted,
          onChanged: onChanged,
          enabled: enabled,
          readOnly: readOnly,
          inputFormatters: inputFormatters,
        ),
      ],
    );
  }
}
