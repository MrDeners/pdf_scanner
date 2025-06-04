//@GeneratedMicroModule;DataPackageModule;package:data/src/di/configure_dependencies.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:data/data.dart' as _i437;
import 'package:data/src/di/register_module.dart' as _i770;
import 'package:data/src/di/revenue_cat_module.dart' as _i701;
import 'package:data/src/providers/local_database/drift.dart' as _i985;
import 'package:data/src/providers/local_database/provider/local_database_provider.dart'
    as _i879;
import 'package:data/src/providers/providers.dart' as _i868;
import 'package:data/src/repositories/repositories.dart' as _i876;
import 'package:domain/domain.dart' as _i494;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

class DataPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) async {
    final registerModule = _$RegisterModule();
    final revenueCatModule = _$RevenueCatModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i879.LocalDatabaseProvider>(
        () => _i879.LocalDatabaseProvider());
    gh.singleton<String>(
      () => revenueCatModule.userId,
      instanceName: 'userId',
    );
    gh.singleton<_i494.DocumentsRepository>(() => _i876.DocumentsRepositoryImpl(
        localDatabaseProvider: gh<_i985.LocalDatabaseProvider>()));
    gh.singleton<String>(
      () => revenueCatModule.revenueCatApiKey,
      instanceName: 'revenueCatApiKey',
    );
    await gh.singletonAsync<_i437.RevenueCatClient>(
      () => revenueCatModule.revenueCatProvider(
        gh<String>(instanceName: 'revenueCatApiKey'),
        gh<String>(instanceName: 'userId'),
      ),
      preResolve: true,
    );
    gh.factory<_i868.LocalDataProvider>(
        () => _i868.LocalDataProvider(prefs: gh<_i460.SharedPreferences>()));
    gh.singleton<_i494.UserRepository>(() => _i876.UserRepositoryImpl(
        localDataProvider: gh<_i437.LocalDataProvider>()));
    gh.singleton<_i494.SubscriptionRepository>(() =>
        _i876.SubscriptionRepositoryImpl(
            adaptyProvider: gh<_i437.RevenueCatClient>()));
  }
}

class _$RegisterModule extends _i770.RegisterModule {}

class _$RevenueCatModule extends _i701.RevenueCatModule {}
