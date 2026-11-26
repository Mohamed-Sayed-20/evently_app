import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../core/utils/size_utils.dart';
import '../../../../../../l10n/app_localizations.dart';
import '../../../../../../providers/app_language_provider.dart';
import '../../../../../../providers/app_theme_provider.dart';
import '../../../../../../providers/user_provider.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({super.key});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    return Row(
      children: [
        Column(
          children: [
            Text(
              AppLocalizations.of(context)!.welcome_back,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              userProvider.user!.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () {
            themeProvider.changeTheme(
              themeProvider.isDarkMode() ? ThemeMode.light : ThemeMode.dark,
            );
          },
          icon: Icon(
            themeProvider.isDarkMode()
                ? Icons.dark_mode_outlined
                : Icons.wb_sunny_outlined,
            color: Theme.of(context).primaryColor,
            size: 30,
          ),
        ),
        InkWell(
          splashColor: AppColors.transparentColor,
          onTap: () {
            languageProvider.changeLanguage(
              languageProvider.language == 'en' ? 'ar' : 'en',
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.02,
              vertical: height * 0.007,
            ),
            margin: EdgeInsetsDirectional.only(start: width * 0.02),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              languageProvider.language.toUpperCase(),
              style: AppStyles.semi14White,
            ),
          ),
        ),
      ],
    );
  }
}
