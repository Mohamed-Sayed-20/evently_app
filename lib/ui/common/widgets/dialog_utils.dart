import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/size_utils.dart';

class DialogUtils {
  static void showLoading({
    required BuildContext context,
    required String loadingMessage,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: context.width * 0.05,
          children: [
            CircularProgressIndicator(color: AppColors.mainLightColor),
            Text(loadingMessage, style: AppStyles.medium18MainColor),
          ],
        ),
      ),
    );
  }

  static void hideLoading({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    required String message,
    String title = '',
    String? posActionName,
    VoidCallback? onPosAction,
    String? negActionName,
    VoidCallback? onNegAction,
  }) {
    List<Widget> action = [];
    if (posActionName != null) {
      action.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onPosAction?.call();
          },
          child: Text(posActionName, style: AppStyles.medium18MainColor),
        ),
      );
    }
    if (negActionName != null) {
      action.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onNegAction?.call();
          },
          child: Text(negActionName, style: AppStyles.medium18MainColor),
        ),
      );
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message, style: AppStyles.semi24MainLightColor),
        title: Text(title, style: AppStyles.medium18MainColor),
        actions: action,
      ),
    );
  }
}
