import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/providers/user_provider.dart';
import 'package:evently_app/ui/screen/add_event/add_event_screen.dart';
import 'package:evently_app/ui/screen/auth/forget/forget_password.dart';
import 'package:evently_app/ui/screen/auth/login/login_screen.dart';
import 'package:evently_app/ui/screen/auth/register/register_screen.dart';
import 'package:evently_app/ui/screen/home/home_screen.dart';
import 'package:evently_app/ui/view/page_on_boarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'core/utils/app_routes.dart';
import 'core/utils/app_theme.dart';
import 'firebase_options.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppLanguageProvider()),
        ChangeNotifierProvider(create: (context) => AppThemeProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
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
        AppRoutes.forgetPasswordRouteName: (context) => ForgetPassword(),
        AppRoutes.addEventRouteName: (context) => AddEventScreen(),
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
