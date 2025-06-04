//@GeneratedMicroModule;NavigationPackageModule;package:navigation/src/di/configure_dependencies.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:navigation/navigation.dart' as _i1058;
import 'package:navigation/src/di/register_module.dart' as _i675;

class NavigationPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final registerModule = _$RegisterModule();
    gh.singleton<_i1058.AppRouter>(() => registerModule.appRouter);
  }
}

class _$RegisterModule extends _i675.RegisterModule {}
