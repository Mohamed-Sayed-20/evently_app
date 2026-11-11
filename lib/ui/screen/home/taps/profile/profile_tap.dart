import 'package:evently_app_1/ui/screen/home/taps/profile/theme/theme_bottom_sheet.dart';
import 'package:evently_app_1/ui/screen/home/taps/profile/widget/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_utils.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/app_language_provider.dart';
import '../../../../../providers/app_theme_provider.dart';
import 'language/language_bottom_sheet.dart';

class ProfileTap extends StatefulWidget {
  const ProfileTap({super.key});

  @override
  State<ProfileTap> createState() => _ProfileTapState();
}

class _ProfileTapState extends State<ProfileTap> {
  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.04,
      ),
      child: Column(
        spacing: height * 0.02,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(AppAssets.logoRouteImage),
          ),
          Text('John Safwat', style: Theme.of(context).textTheme.headlineLarge),
          Text(
            'johnsafwat.route@gmail.com',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: height * 0.01),
          ProfileItem(
            text: AppLocalizations.of(context)!.dark_mode,
            item: Switch(
              value: themeProvider.isDarkMode(),
              onChanged: (value) {
                themeProvider.changeTheme(
                  value ? ThemeMode.dark : ThemeMode.light,
                );
              },
              activeTrackColor: Theme.of(context).primaryColor,
              inactiveThumbColor: AppColors.whiteColor,
              trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.selected)) {
                  return Colors.transparent;
                }
                return AppColors.lightGreyColor;
              }),
            ),
          ),
          ProfileItem(
            text: AppLocalizations.of(context)!.language,
            item: IconButton(
              onPressed: () {
                showLanguageBottomSheet();
              },
              icon: Icon(Icons.arrow_forward_ios_outlined, size: 25),
            ),
          ),
          ProfileItem(
            text: AppLocalizations.of(context)!.logout,
            item: IconButton(
              onPressed: () {},
              icon: Icon(Icons.logout, color: AppColors.redColor, size: 25),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }
}
