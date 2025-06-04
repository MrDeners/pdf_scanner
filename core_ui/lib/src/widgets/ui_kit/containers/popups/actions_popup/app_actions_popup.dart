import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';

final class AppActionsPopup {
  static Future<void> open({
    required BuildContext context,
    required List<CupertinoActionSheetAction> actions,
  }) async {
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        actions: actions,
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () => Navigator.maybePop(context),
          child: Text(
            LocaleKeys.common_cancel.watchTr(context),
            style: AppFonts.h4.copyWith(color: AppColors.appleBlue),
          ),
        ),
      ),
    );
  }
}
