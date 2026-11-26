import 'package:flutter/material.dart';

import '../../../../../core/utils/size_utils.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../widget/event_item.dart';

class FavoriteTap extends StatelessWidget {
  const FavoriteTap({super.key});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    return Column(
      spacing: height * 0.02,
      children: [
        CustomTextField(
          hintText: AppLocalizations.of(context)!.search_event,
          hintStyle: Theme.of(context).textTheme.bodyLarge,
          suffixIcon: Icon(
            Icons.search,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return EventItem();
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: height * 0.02);
            },
            itemCount: 50,
          ),
        ),
      ],
    );
  }
}
