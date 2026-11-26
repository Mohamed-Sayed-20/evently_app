import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/size_utils.dart';
import '../../../../../../model/category.dart';
import '../../widget/category_item.dart';

class EventListSection extends StatefulWidget {
  const EventListSection({super.key});

  @override
  State<EventListSection> createState() => _EventListSectionState();
}

class _EventListSectionState extends State<EventListSection> {
  List<Category> categoryList = Category.getAllCategories();

  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = context.width;

    return DefaultTabController(
      length: categoryList.length,
      child: TabBar(
        isScrollable: true,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        labelPadding: EdgeInsets.symmetric(horizontal: width * 0.02),
        tabAlignment: TabAlignment.start,
        dividerColor: AppColors.transparentColor,
        indicatorColor: AppColors.transparentColor,
        tabs: categoryList.map((category) {
          return CategoryItem(
            category: category,
            isSelected: selectedIndex == categoryList.indexOf(category),
          );
        }).toList(),
      ),
    );
  }
}
