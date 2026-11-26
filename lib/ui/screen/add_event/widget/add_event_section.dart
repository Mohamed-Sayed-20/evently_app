import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/size_utils.dart';
import '../../../../model/category.dart';
import '../../../../providers/app_theme_provider.dart';

class AddEventSection extends StatelessWidget {
  const AddEventSection({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    List<Category> categoryEvent = Category.getCategories();
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Container(
      height: height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Theme.of(context).dividerColor, width: 2),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            categoryEvent[selectedIndex].getCategoriesImag(
              themeProvider.isDarkMode(),
            ),
          ),
        ),
      ),
    );
  }
}
