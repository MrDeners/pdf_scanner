import 'package:core_ui/core_ui.dart';

final class AppAlertDialogItem {
  final String title;
  final AppTextButtonStyle style;
  final Widget? tailing;
  final bool isEnabled;
  final bool isExpanded;
  final VoidCallback onTap;

  const AppAlertDialogItem({
    required this.title,
    required this.onTap,
    this.style = AppTextButtonStyle.primary,
    this.isEnabled = true,
    this.isExpanded = false,
    this.tailing,
  });
}
