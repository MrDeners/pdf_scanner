import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:doc_scanner/app_bloc/widgets/toast_wrapper.dart';
import 'package:flutter/services.dart';
import 'package:navigation/navigation.dart';

Future<void> mainCommon(Flavor flavor) async {
  await dotenv.load();

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ScreenService.setPreferredOrientation();

  final String deviceId = await IdService.deviceId;

  configureDependencies(
    flavor: flavor,
    deviceId: deviceId,
  );

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = appLocator<AppRouter>();

    return EasyLocalization(
      path: AppLocalization.langFolderPath,
      supportedLocales: AppLocalization.supportedLocales,
      fallbackLocale: AppLocalization.fallbackLocale,
      child: Builder(
        builder: (BuildContext context) {
          final ThemeData theme = context.theme;

          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: appRouter.config(),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: theme,
            builder: (BuildContext context, Widget? child) {
              final AppColorsTheme colors = context.colors;

              return AppBlocProvider(
                child: AnnotatedRegion<SystemUiOverlayStyle>(
                  value: SystemUiOverlayStyle(systemNavigationBarColor: colors.primary),
                  child: child ?? const SizedBox(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
