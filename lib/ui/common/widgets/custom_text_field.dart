import 'package:evently_app_1/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

typedef OnChanged = void Function(String)?;
typedef OnValidator = String? Function(String?)?;

class CustomTextField extends StatelessWidget {
  final double radius;
  final Color? borderColor;
  final bool? filled;
  final Color? fillColor;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final TextEditingController? controller;
  final OnChanged onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? obscuringCharacter;
  final OnValidator validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    this.radius = 16,
    this.borderColor,
    this.filled,
    this.fillColor,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.style,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType,
    this.obscuringCharacter,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: style,
      decoration: InputDecoration(
        enabledBorder: _builtDecorationItem(
          borderSideColor: Theme.of(context).dividerColor,
        ),
        focusedBorder: _builtDecorationItem(
          borderSideColor: Theme.of(context).dividerColor,
        ),
        errorBorder: _builtDecorationItem(borderSideColor: AppColors.redColor),
        focusedErrorBorder: _builtDecorationItem(
          borderSideColor: AppColors.redColor,
        ),
        filled: filled,
        fillColor: fillColor,
        hintText: hintText,
        hintStyle: hintStyle,
        labelText: labelText,
        labelStyle: labelStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType ?? TextInputType.text,
      obscuringCharacter: obscuringCharacter ?? '*',
      validator: validator,
    );
  }

  OutlineInputBorder _builtDecorationItem({required Color borderSideColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(width: 2, color: borderColor ?? borderSideColor),
    );
  }
}
