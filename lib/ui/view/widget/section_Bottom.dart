import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/size_utils.dart';
import '../../../providers/app_theme_provider.dart';

class SectionBottom extends StatelessWidget {
  const SectionBottom({
    super.key,
    required this.isSelected,
    required this.onPressed,
    this.text,
    this.icon,
    this.radius = 8,
    this.borderColor,
  });

  final bool isSelected;
  final IconData? icon;
  final VoidCallback onPressed;
  final String? text;
  final double radius;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var textColor = themeProvider.isDarkMode()
        ? AppColors.whiteColor
        : isSelected
        ? AppColors.whiteColor
        : AppColors.mainLightColor;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.01,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).primaryColor
              : Theme.of(context).highlightColor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: borderColor ?? AppColors.transparentColor),
        ),
        child: text != null
            ? Text(
                text!,
                style: themeProvider.isDarkMode()
                    ? AppStyles.semi14White
                    : isSelected
                    ? AppStyles.semi14White
                    : AppStyles.semi14MainLightColor,
              )
            : Icon(icon, size: 25, color: textColor),
      ),
    );
  }
}
