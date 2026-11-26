import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../providers/app_theme_provider.dart';
import '../../../common/widgets/custom_elevated_button.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    var local = AppLocalizations.of(context)!;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          local.forget_password,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        leading: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.02,
            vertical: height * 0.01,
          ),
          child: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).highlightColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 2,
                ),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: themeProvider.isDarkMode()
                  ? AppColors.whiteColor
                  : AppColors.mainLightColor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: height * 0.04,
          children: [
            SizedBox(height: height * 0.01),
            Center(
              child: Image.asset(
                themeProvider.isDarkMode()
                    ? AppAssets.forgetPasswordDarkImage
                    : AppAssets.forgetPasswordLightImage,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            CustomElevatedButton(
              verticalPadding: height * 0.015,
              onPressed: () {},
              child: Text(local.reset_password, style: AppStyles.medium20White),
            ),
          ],
        ),
      ),
    );
  }
}
