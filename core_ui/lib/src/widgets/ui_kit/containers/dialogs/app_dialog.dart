import 'package:core_ui/core_ui.dart';

final class AppDialog {
  static Future<void> openDialog({
    required BuildContext context,
    required Widget child,
  }) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) => child,
      barrierDismissible: false,
    );
  }
}
