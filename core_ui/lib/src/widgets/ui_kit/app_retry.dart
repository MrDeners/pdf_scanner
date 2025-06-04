import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';

class AppRetry extends StatelessWidget {
  final String? message;
  final VoidCallback? onRetry;

  const AppRetry({
    this.onRetry,
    this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (onRetry != null)
            IconButton(
              onPressed: onRetry,
              icon: const Icon(
                Icons.refresh,
                size: AppDimens.iconSizeLarge,
              ),
            ),
          const SizedBox(height: AppDimens.spacerSmall),
          Text(
            message ?? LocaleKeys.errors_unknown.watchTr(context),
            style: AppFonts.h4.copyWith(color: colors.onSecondary),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
