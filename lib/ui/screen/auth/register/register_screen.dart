import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../firebase_utils.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../model/my_user.dart';
import '../../../../providers/app_theme_provider.dart';
import '../../../../providers/user_provider.dart';
import '../../../common/widgets/custom_elevated_button.dart';
import '../../../common/widgets/custom_text_field.dart';
import '../../../common/widgets/dialog_utils.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameController = TextEditingController(text: '');

  var emailController = TextEditingController(text: '');

  var passwordController = TextEditingController(text: '');

  var rePasswordController = TextEditingController(text: '');

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
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
                    AppLocalizations.of(context)!.create_your_account,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  CustomTextField(
                    filled: true,
                    fillColor: Theme.of(context).highlightColor,
                    hintText: AppLocalizations.of(context)!.please_enter_name,
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                    prefixIcon: Icon(
                      Icons.perm_identity_outlined,
                      color: AppColors.lightGreyColor,
                      size: 25,
                    ),
                    controller: nameController,
                    validator: (text) {
                      //todo: validation
                      if (text == null || text.trim().isEmpty) {
                        return AppLocalizations.of(context)!.please_enter_name;
                      }
                      return null;
                    },
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
                      if (text == null || text.trim().isEmpty) {
                        return AppLocalizations.of(context)!.please_enter_email;
                      }
                      final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      ).hasMatch(text);
                      if (!emailValid) {
                        return AppLocalizations.of(context)!
                            .please_enter_valid_email;
                      }
                      return null;
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
                      if (text == null || text.trim().isEmpty) {
                        return AppLocalizations.of(context)!
                            .please_enter_password;
                      }
                      if (text.length < 6) {
                        return AppLocalizations.of(context)!
                            .password_validation;
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    filled: true,
                    fillColor: Theme.of(context).highlightColor,
                    hintText: AppLocalizations.of(context)!
                        .please_enter_rePassword,
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
                    controller: rePasswordController,
                    obscureText: true,
                    validator: (text) {
                      //todo: validation
                      if (text == null || text.trim().isEmpty) {
                        return AppLocalizations.of(context)!.re_password;
                      }
                      if (text != passwordController.text) {
                        return AppLocalizations.of(context)!
                            .re_password_validation;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.01),
                  CustomElevatedButton(
                    backgroundColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      //todo: sign_up
                      signup();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.sign_up,
                      style: AppStyles.medium20White,
                    ),
                  ),
                  SizedBox(height: height * 0.001),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${AppLocalizations.of(context)!.already_have_account} ?',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      TextButton(
                        onPressed: () {
                          //todo:navigate to Login screen
                          Navigator.pop(context);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.login,
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
                      //todo:signUp with google
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

  void signup() async {
    if (formKey.currentState?.validate() == true) {
      try {
        //todo: hide Loading
        DialogUtils.showLoading(context: context, loadingMessage: 'Waiting...');
        //todo: create user in firestore Auth
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
        //todo: save user in firestore
        MyUser myUser = MyUser(
          id: credential.user?.uid ?? '',
          name: nameController.text,
          email: emailController.text,
        );
        //todo: save user in provider
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.updateUser(myUser);
        await FirebaseUtils.addUserInFireStore(myUser);
        //todo: hide Loading
        DialogUtils.hideLoading(context: context);
        //todo: show Message
        DialogUtils.showMessage(
          context: context,
          message: 'Register successfully',
          title: 'Success',
          posActionName: 'ok',
          onPosAction: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.homeRouteName);
          },
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          //todo: hide Loading
          DialogUtils.hideLoading(context: context);
          //todo: show Message
          DialogUtils.showMessage(
            context: context,
            message: 'The password provided is too weak.',
            title: 'Error',
            posActionName: 'ok',
          );
        } else if (e.code == 'email-already-in-use') {
          //todo: hide Loading
          DialogUtils.hideLoading(context: context);
          //todo: show Message
          DialogUtils.showMessage(
            context: context,
            message: 'The account already exists for that email.',
            title: 'Error',
            posActionName: 'ok',
          );
        } else if (e.code == 'network-request-failed') {
          //todo: hide Loading
          DialogUtils.hideLoading(context: context);
          //todo: show Message
          DialogUtils.showMessage(
            context: context,
            message: 'Thrown if there was a network request error.',
            title: 'Error',
            posActionName: 'ok',
          );
        }
      } catch (e) {
        //todo: hide Loading
        DialogUtils.hideLoading(context: context);
        //todo: show Message
        DialogUtils.showMessage(
          context: context,
          message: e.toString(),
          title: 'Error',
          posActionName: 'ok',
        );
      }
    }
  }
}
