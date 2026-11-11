import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_utils.dart';

class ProfileItem extends StatelessWidget {
  final String text;

  final Widget item;

  const ProfileItem({super.key, required this.text, required this.item});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(16),
        color: Theme.of(context).highlightColor,
        border: Border.all(color: Theme.of(context).dividerColor, width: 2),
      ),
      child: ListTile(
        title: Text(text, style: Theme.of(context).textTheme.headlineMedium),
        trailing: item,
      ),
    );
  }
}
