import 'package:evently_app_1/providers/app_language_provider.dart';
import 'package:evently_app_1/providers/app_theme_provider.dart';
import 'package:evently_app_1/ui/screen/auth/login/login_screen.dart';
import 'package:evently_app_1/ui/screen/auth/register/register_screen.dart';
import 'package:evently_app_1/ui/screen/home/home_screen.dart';
import 'package:evently_app_1/ui/view/page_on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'core/utils/app_routes.dart';
import 'core/utils/app_theme.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppLanguageProvider()),
        ChangeNotifierProvider(create: (context) => AppThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      initialRoute: AppRoutes.pageOnBoardingRouteName,
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.pageOnBoardingRouteName: (context) => PageOnBoarding(),
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.loginRouteName: (context) => LoginScreen(),
        AppRoutes.registerRouteName: (context) => RegisterScreen(),
      },
      locale: Locale(languageProvider.language),
      localizationsDelegates: [
        AppLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.appTheme,
    );
  }
}
