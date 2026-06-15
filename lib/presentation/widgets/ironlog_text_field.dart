import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/theme/app_typography.dart';

/// Styled text input consistent with the IronLog design system.
class IronLogTextField extends StatelessWidget {
  const IronLogTextField({
    super.key,
    required this.label,
    this.controller,
    this.hint,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
    this.onSubmitted,
    this.maxLines = 1,
    this.textInputAction,
    this.autofocus = false,
    this.suffix,
    this.prefixIcon,
    this.obscureText = false,
  });

  final String label;
  final TextEditingController? controller;
  final String? hint;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final int maxLines;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final Widget? suffix;
  final Widget? prefixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      maxLines: maxLines,
      textInputAction: textInputAction,
      autofocus: autofocus,
      obscureText: obscureText,
      style: AppTypography.body,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        suffix: suffix,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
