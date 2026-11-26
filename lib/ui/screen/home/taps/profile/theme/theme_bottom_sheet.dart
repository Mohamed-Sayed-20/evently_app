import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../core/utils/size_utils.dart';
import '../../../../../../l10n/app_localizations.dart';
import '../../../../../../providers/app_theme_provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.04,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: height * 0.02,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              themeProvider.changeTheme(ThemeMode.dark);
            },
            child: themeProvider.isDarkMode()
                ? _getSelectedThemeItem(
                    theme: AppLocalizations.of(context)!.dark,
                  )
                : _getUnSelectedThemeItem(
                    theme: AppLocalizations.of(context)!.dark,
                  ),
          ),
          InkWell(
            onTap: () {
              themeProvider.changeTheme(ThemeMode.light);
            },
            child: (!themeProvider.isDarkMode())
                ? _getSelectedThemeItem(
                    theme: AppLocalizations.of(context)!.light,
                  )
                : _getUnSelectedThemeItem(
                    theme: AppLocalizations.of(context)!.light,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _getSelectedThemeItem({required String theme}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(theme, style: AppStyles.semi16MainDark),
        Icon(Icons.check, color: AppColors.mainDarkColor, size: 30),
      ],
    );
  }

  Widget _getUnSelectedThemeItem({required String theme}) {
    return Row(children: [Text(theme, style: AppStyles.semi16MainDark)]);
  }
}
