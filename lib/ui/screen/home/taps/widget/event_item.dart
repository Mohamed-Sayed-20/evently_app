import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/size_utils.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/app_theme_provider.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).dividerColor, width: 2),
        image: DecorationImage(
          image: AssetImage(
            themeProvider.isDarkMode()
                ? AppAssets.birthdayDarkImage
                : AppAssets.birthdayLightImage,
          ),
          fit: BoxFit.cover,
        ),
      ),
      height: height * 0.23,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.01,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.01,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).highlightColor,
              border: Border.all(
                color: Theme.of(context).dividerColor,
                width: 2,
              ),
            ),
            child: Text(
              '21 Jan',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.01,
            ),
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).highlightColor,
              border: Border.all(
                color: Theme.of(context).dividerColor,
                width: 2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.birthday,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                IconButton(
                  onPressed: () {
                    //todo: add to favorite
                  },
                  icon: Icon(
                    Icons.favorite_outline_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
