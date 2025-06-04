import 'package:core_ui/core_ui.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hasScrollBody: false,
      hasAppBar: false,
      content: Center(
        child: AppImages.logo2x.call(
          size: MediaQuery.sizeOf(context).width / 2,
          needClip: true,
        ),
      ),
    );
  }
}
