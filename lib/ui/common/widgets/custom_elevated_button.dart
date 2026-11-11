import 'package:evently_app_1/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final double radius;
  final Color? borderSide;
  final Color? backgroundColor;
  final double? verticalPadding;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.radius = 16,
    this.borderSide,
    this.backgroundColor,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: BorderSide(
            width: 2,
            color: borderSide ?? AppColors.transparentColor,
          ),
        ),
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 0),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
