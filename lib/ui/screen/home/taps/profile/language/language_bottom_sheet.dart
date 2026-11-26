import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../core/utils/size_utils.dart';
import '../../../../../../l10n/app_localizations.dart';
import '../../../../../../providers/app_language_provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
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
              languageProvider.changeLanguage('en');
            },
            child: languageProvider.language == 'en'
                ? _getSelectedLanguageItem(
                    language: AppLocalizations.of(context)!.english,
                  )
                : _getUnSelectedLanguageItem(
                    language: AppLocalizations.of(context)!.english,
                  ),
          ),
          InkWell(
            onTap: () {
              languageProvider.changeLanguage('ar');
            },
            child: languageProvider.language == 'ar'
                ? _getSelectedLanguageItem(
                    language: AppLocalizations.of(context)!.arabic,
                  )
                : _getUnSelectedLanguageItem(
                    language: AppLocalizations.of(context)!.arabic,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _getSelectedLanguageItem({required String language}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(language, style: AppStyles.semi20Black),
        Icon(Icons.check, color: AppColors.mainDarkColor, size: 30),
      ],
    );
  }

  Widget _getUnSelectedLanguageItem({required String language}) {
    return Row(
      children: [Text(language, style: AppStyles.medium18MainDarkColor)],
    );
  }
}
