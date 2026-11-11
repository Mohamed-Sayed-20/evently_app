import 'package:evently_app_1/core/utils/app_assets.dart';
import 'package:evently_app_1/core/utils/app_colors.dart';
import 'package:evently_app_1/core/utils/app_routes.dart';
import 'package:evently_app_1/core/utils/app_styles.dart';
import 'package:evently_app_1/core/utils/size_utils.dart';
import 'package:evently_app_1/l10n/app_localizations.dart';
import 'package:evently_app_1/providers/app_theme_provider.dart';
import 'package:evently_app_1/ui/common/widgets/custom_elevated_button.dart';
import 'package:evently_app_1/ui/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Form(
              key: formKey,
              child: Column(
                spacing: height * 0.02,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    themeProvider.isDarkMode()
                        ? AppAssets.logoDarkImage
                        : AppAssets.logoLightImage,
                  ),
                  Text(
                    AppLocalizations.of(context)!.login_to_your_account,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  CustomTextField(
                    filled: true,
                    fillColor: Theme.of(context).highlightColor,
                    hintText: AppLocalizations.of(context)!.please_enter_email,
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: AppColors.lightGreyColor,
                      size: 25,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (text) {
                      //todo: validation
                    },
                  ),
                  CustomTextField(
                    filled: true,
                    fillColor: Theme.of(context).highlightColor,
                    hintText: AppLocalizations.of(context)!
                        .please_enter_password,
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: AppColors.lightGreyColor,
                      size: 25,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility_off_outlined,
                      color: AppColors.lightGreyColor,
                      size: 25,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    obscureText: true,
                    validator: (text) {
                      //todo: validation
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          //todo:navigate to forget password screen
                        },
                        child: Text(
                          '${AppLocalizations.of(context)!.forget_password} ?',
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: Theme.of(context).primaryColor,
                              ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  CustomElevatedButton(
                    backgroundColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      //todo: login
                      Navigator.of(context).pushNamed(AppRoutes.homeRouteName);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.login,
                      style: AppStyles.medium20White,
                    ),
                  ),
                  SizedBox(height: height * 0.001),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${AppLocalizations.of(context)!.do_not_have_an_account} ?',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      TextButton(
                        onPressed: () {
                          //todo:navigate to forget password screen
                          Navigator.of(context)
                              .pushNamed(AppRoutes.registerRouteName);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.sign_up,
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: Theme.of(context).primaryColor,
                                decorationThickness: 2,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Theme.of(context).dividerColor,
                          indent: width * 0.02,
                          endIndent: width * 0.04,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.or,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Theme.of(context).dividerColor,
                          indent: width * 0.04,
                          endIndent: width * 0.02,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  CustomElevatedButton(
                    onPressed: () {
                      //todo:login with google
                    },
                    backgroundColor: Theme.of(context).highlightColor,
                    verticalPadding: height * 0.02,
                    child: Row(
                      spacing: width * 0.02,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.logoGoogleImage),
                        Text(
                          AppLocalizations.of(context)!.sign_up_with_google,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
