import 'package:evently_app/ui/view/widget/section_Bottom.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_routes.dart';
import '../../core/utils/app_styles.dart';
import '../../core/utils/size_utils.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/app_language_provider.dart';
import '../../providers/app_theme_provider.dart';
import '../common/widgets/custom_elevated_button.dart';

class PageOnBoarding extends StatefulWidget {
  const PageOnBoarding({super.key});

  @override
  State<PageOnBoarding> createState() => _PageOnBoardingState();
}

class _PageOnBoardingState extends State<PageOnBoarding> {
  final intKey = GlobalKey<IntroductionScreenState>();
  int countPage = 0;

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode()
          ? AppColors.darkBgColor
          : AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            AppBar(
              backgroundColor: AppColors.transparentColor,
              title: Center(
                child: Image.asset(
                  themeProvider.isDarkMode()
                      ? AppAssets.logoOnboardingDark
                      : AppAssets.logoOnboardingLight,
                ),
              ),
            ),
            SizedBox(height: height * 0.06),
            Expanded(
              child: IntroductionScreen(
                showNextButton: false,
                showDoneButton: false,
                showBackButton: true,
                key: intKey,
                onChange: (index) {
                  countPage = index;
                  setState(() {});
                },
                back: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 25,
                  color: themeProvider.isDarkMode()
                      ? AppColors.whiteDarkColor
                      : AppColors.mainDarkColor,
                ),
                globalBackgroundColor: themeProvider.isDarkMode()
                    ? AppColors.darkBgColor
                    : AppColors.whiteColor,
                pages: [
                  PageViewModel(
                    title: AppLocalizations.of(context)!.title1,
                    body: AppLocalizations.of(context)!.body1,
                    image: Image.asset(
                      themeProvider.isDarkMode()
                          ? AppAssets.intro1dark
                          : AppAssets.intro1light,
                    ),
                    decoration: getPageDecoration(),
                    footer: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.04,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.language,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge,
                              ),
                              Row(
                                spacing: width * 0.04,
                                children: [
                                  SectionBottom(
                                    text: AppLocalizations.of(context)!.english,
                                    isSelected:
                                        languageProvider.language == 'en',
                                    onPressed: () =>
                                        languageProvider.changeLanguage('en'),
                                    borderColor: Theme.of(context).dividerColor,
                                  ),
                                  SectionBottom(
                                    text: AppLocalizations.of(context)!.arabic,
                                    isSelected:
                                        languageProvider.language == 'ar',
                                    onPressed: () =>
                                        languageProvider.changeLanguage('ar'),
                                    borderColor: Theme.of(context).dividerColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.04,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.theme,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge,
                              ),
                              Row(
                                spacing: width * 0.04,
                                children: [
                                  SectionBottom(
                                    icon: Icons.wb_sunny_outlined,
                                    isSelected:
                                        themeProvider.appTheme ==
                                        ThemeMode.light,
                                    onPressed: () => themeProvider.changeTheme(
                                      ThemeMode.light,
                                    ),
                                    borderColor: Theme.of(context).dividerColor,
                                  ),
                                  SectionBottom(
                                    icon: Icons.nightlight_outlined,
                                    isSelected:
                                        themeProvider.appTheme ==
                                        ThemeMode.dark,
                                    onPressed: () => themeProvider.changeTheme(
                                      ThemeMode.dark,
                                    ),
                                    borderColor: Theme.of(context).dividerColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  PageViewModel(
                    title: AppLocalizations.of(context)!.title2,
                    body: AppLocalizations.of(context)!.body2,
                    image: Image.asset(
                      themeProvider.isDarkMode()
                          ? AppAssets.intro2dark
                          : AppAssets.intro2light,
                    ),
                    decoration: getPageDecoration(),
                  ),
                  PageViewModel(
                    title: AppLocalizations.of(context)!.title3,
                    body: AppLocalizations.of(context)!.body3,
                    image: Image.asset(
                      themeProvider.isDarkMode()
                          ? AppAssets.intro3dark
                          : AppAssets.intro3light,
                    ),
                    decoration: getPageDecoration(),
                  ),
                  PageViewModel(
                    title: AppLocalizations.of(context)!.title4,
                    body: AppLocalizations.of(context)!.body4,
                    image: Image.asset(
                      themeProvider.isDarkMode()
                          ? AppAssets.intro4dark
                          : AppAssets.intro4light,
                    ),
                    decoration: getPageDecoration(),
                  ),
                ],
                dotsDecorator: getDotDecoration(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.02,
                horizontal: width * 0.04,
              ),
              child: SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  verticalPadding: height * 0.01,
                  onPressed: () {
                    if (countPage < 3) {
                      intKey.currentState?.next();
                    } else {
                      Navigator.of(context).pushNamed(AppRoutes.loginRouteName);
                    }
                  },
                  child: Text(
                    countPage == 3
                        ? AppLocalizations.of(context)!.done
                        : AppLocalizations.of(context)!.next,
                    style: AppStyles.medium20WhiteDarkColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
          ],
        ),
      ),
    );
  }

  PageDecoration getPageDecoration() {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return PageDecoration(
      titleTextStyle: AppStyles.medium20BlackColor.copyWith(
        color: themeProvider.isDarkMode()
            ? AppColors.whiteColor
            : AppColors.blackColor,
      ),
      bodyTextStyle: AppStyles.regular16GreyColor.copyWith(
        color: themeProvider.isDarkMode()
            ? AppColors.lightGreyColor
            : AppColors.greyColor,
      ),
      imagePadding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
      titlePadding: EdgeInsets.symmetric(vertical: context.height * 0.01),
      bodyPadding: EdgeInsets.symmetric(horizontal: context.width * 0.01),
    );
  }

  DotsDecorator getDotDecoration() {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return DotsDecorator(
      color: themeProvider.isDarkMode()
          ? AppColors.whiteColor
          : AppColors.lightGreyColor,
      size: Size(8, 8),
      activeSize: Size(18, 8),
      activeColor: Theme.of(context).primaryColor,
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(28),
      ),
    );
  }
}
