import 'package:core_ui/core_ui.dart';

class AppScaffold extends StatelessWidget {
  final VoidCallback? onClose;
  final String title;
  final Widget content;
  final Widget? floatingActionButton;
  final bool hasScrollBody;
  final bool hasAppBar;
  final bool hasPadding;
  final Color? backgroundColor;
  final Color? contentColor;
  final AppIconButtonStyle? backButtonStyle;
  final Gradient? backgroundGradient;
  final EdgeInsets? pagePadding;
  final String? errorText;
  final VoidCallback? onRetry;
  final bool isLoading;
  final bool useSafeArea;

  const AppScaffold({
    required this.content,
    this.title = '',
    this.hasScrollBody = true,
    this.hasAppBar = true,
    this.hasPadding = true,
    this.isLoading = false,
    this.useSafeArea = true,
    this.floatingActionButton,
    this.onRetry,
    this.errorText,
    this.onClose,
    this.backgroundColor,
    this.contentColor,
    this.backButtonStyle,
    this.backgroundGradient,
    this.pagePadding,
    super.key,
  })  : assert(
          backgroundColor == null || backgroundGradient == null,
          'Cannot set both backgroundColor and backgroundGradient',
        ),
        assert(
          pagePadding == null || hasPadding == true,
          'Cannot use pagePadding without setting hasPadding to true',
        ),
        assert(
          title == '' || hasAppBar == true,
          'Cannot set title without setting hasAppBar to true',
        );

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final Color backgroundColor =
        this.backgroundColor ?? (backgroundGradient != null ? Colors.transparent : colors.primary);

    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: backgroundGradient,
            ),
            child: Scaffold(
              floatingActionButton: floatingActionButton,
              backgroundColor: backgroundColor,
              resizeToAvoidBottomInset: true,
              appBar: hasAppBar ? const CustomAppBar() : null,
              body: Padding(
                padding: pagePadding ??
                    (hasPadding
                        ? const EdgeInsets.all(AppDimens.defaultPagePadding)
                        : EdgeInsets.zero),
                child: hasScrollBody
                    ? SingleChildScrollView(
                        physics: const ClampingScrollPhysics(),
                        child: _content,
                      )
                    : useSafeArea
                        ? SafeArea(
                            left: false,
                            right: false,
                            child: _content,
                          )
                        : _content,
              ),
            ),
          ),
        ),
        if (isLoading) const AppLoadingIndicator(),
      ],
    );
  }

  Widget get _content {
    if (errorText != null || onRetry != null) {
      return AppRetry(
        message: errorText,
        onRetry: onRetry,
      );
    } else {
      return content;
    }
  }
}
