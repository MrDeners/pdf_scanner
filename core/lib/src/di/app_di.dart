import 'package:core/src/config/app_config.dart';
import 'package:core/src/di/app_di.config.dart';
import 'package:core/src/events/events.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:navigation/navigation.dart';

final GetIt appLocator = GetIt.instance;

const String unauthScope = 'unauthScope';
const String authScope = 'authScope';

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
  includeMicroPackages: false,
  externalPackageModulesBefore: <ExternalModule>[
    ExternalModule(NavigationPackageModule),
    ExternalModule(DataPackageModule),
    ExternalModule(DomainPackageModule),
  ],
)
void configureDependencies({required Flavor flavor, required String deviceId}) {
  appLocator.registerLazySingleton<AppConfig>(
    () => AppConfig.fromFlavor(
      flavor,
      deviceId: deviceId,
    ),
  );

  appLocator.registerLazySingleton<AppEventBus>(
    AppEventBus.new,
  );

  appLocator.registerLazySingleton<AppEventNotifier>(
    appLocator<AppEventBus>,
  );

  appLocator.registerLazySingleton<AppEventObserver>(
    appLocator<AppEventBus>,
  );

  appLocator.init();
}
