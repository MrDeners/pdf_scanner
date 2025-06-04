import 'package:auto_route/auto_route.dart';
import 'package:core_ui/core_ui.dart';

abstract final class RouteBuilder {
  static Route<T> bottomSheet<T>(
    BuildContext context,
    Widget child,
    AutoRoutePage<T> page,
  ) {
    return ModalBottomSheetRoute<T>(
      isScrollControlled: true,
      settings: page,
      backgroundColor: Colors.transparent,
      sheetAnimationStyle: AnimationStyle(duration: AppDimens.animationDurationShort),
      builder: (BuildContext context) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * 0.35 + MediaQuery.viewInsetsOf(context).bottom),
          child: child,
        );
      },
    );
  }
}
