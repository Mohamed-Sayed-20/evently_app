import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/size_utils.dart';
import '../../../../../model/category.dart';
import '../../../../../providers/app_language_provider.dart';

class CategoryItem extends StatelessWidget {
  final bool isSelected;
  final Category category;

  const CategoryItem({
    super.key,
    required this.category,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var width = context.width;
    var height = context.height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.01,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected
              ? AppColors.transparentColor
              : Theme.of(context).dividerColor,
          width: 2,
        ),
        color: isSelected
            ? Theme.of(context).primaryColor
            : Theme.of(context).highlightColor,
      ),
      child: Row(
        spacing: width * 0.02,
        children: [
          Icon(
            category.icon,
            color: isSelected
                ? AppColors.whiteColor
                : Theme.of(context).primaryColor,
          ),
          Text(
            category.getCategoriesName(languageProvider.language),
            style: isSelected
                ? AppStyles.medium16White
                : Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
