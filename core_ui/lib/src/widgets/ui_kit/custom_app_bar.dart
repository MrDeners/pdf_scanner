import 'package:core_ui/core_ui.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: AppDimens.defaultPagePadding,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: AppImages.logo2x.call(size: 160),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppDimens.defaultAppBarHeight);
}
