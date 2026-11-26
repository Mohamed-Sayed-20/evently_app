import 'package:evently_app/ui/screen/home/taps/home/widget/event_list_section.dart';
import 'package:evently_app/ui/screen/home/taps/home/widget/header_section.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/size_utils.dart';
import '../widget/event_item.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    return Column(
      spacing: height * 0.02,
      children: [
        HeaderSection(),
        EventListSection(),
        _widgetEventListViewSection(),
      ],
    );
  }

  Widget _widgetEventListViewSection() {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return EventItem();
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: context.height * 0.02);
        },
        itemCount: 50,
      ),
    );
  }
}
