import 'package:evently_app/ui/screen/home/taps/profile/theme/theme_bottom_sheet.dart';
import 'package:evently_app/ui/screen/home/taps/profile/widget/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/size_utils.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../../../../../providers/user_provider.dart';
import 'language/language_bottom_sheet.dart';

class ProfileTap extends StatefulWidget {
  const ProfileTap({super.key});

  @override
  State<ProfileTap> createState() => _ProfileTapState();
}

class _ProfileTapState extends State<ProfileTap> {
  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.04),
      child: Column(
        spacing: height * 0.02,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(AppAssets.logoRouteImage),
          ),
          Text(
            userProvider.user!.name,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            userProvider.user!.email,
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
              onPressed: () {
                //todo: logout
                Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoutes.loginRouteName,
                  (route) => false,
                );
              },
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
