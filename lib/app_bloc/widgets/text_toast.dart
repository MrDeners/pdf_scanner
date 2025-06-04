import 'package:core_ui/core_ui.dart';

import 'package:doc_scanner/app_bloc/widgets/toast_mapper.dart';

class TextToast extends StatefulWidget {
  final String text;
  final ToastType type;
  final void Function() onDispose;

  const TextToast({
    required this.text,
    required this.type,
    required this.onDispose,
  });

  @override
  _TextToastState createState() => _TextToastState();
}

class _TextToastState extends State<TextToast> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: AppDimens.animationDurationMedium,
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, -4.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();

    Future<void>.delayed(
      const Duration(seconds: 2),
      _dismissNotification,
    );
  }

  void _dismissNotification() {
    Future<void>.delayed(
      AppDimens.animationDurationMedium,
      () => widget.onDispose(),
    );
    if (!_controller.isDismissed) {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme appColors = context.colors;

    return Material(
      color: Colors.transparent,
      child: SlideTransition(
        position: _offsetAnimation,
        child: GestureDetector(
          onTap: _dismissNotification,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: AppDimens.defaultPagePadding,
            ),
            constraints: const BoxConstraints(maxWidth: 300),
            decoration: BoxDecoration(
              color: ToastMapper.getBackgroundColor(
                type: widget.type,
                colors: appColors,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(AppDimens.borderRadiusLarge),
              ),
            ),
            child: Text(
              widget.text,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                color: appColors.onSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    widget.onDispose();
    super.dispose();
  }
}
