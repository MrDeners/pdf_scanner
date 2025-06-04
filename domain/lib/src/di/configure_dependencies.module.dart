//@GeneratedMicroModule;DomainPackageModule;package:domain/src/di/configure_dependencies.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:domain/domain.dart' as _i494;
import 'package:domain/src/use_cases/documents/documents_usecases.dart' as _i53;
import 'package:domain/src/use_cases/subscription/subscription_usecases.dart'
    as _i105;
import 'package:domain/src/use_cases/user/user_usecases.dart' as _i604;
import 'package:injectable/injectable.dart' as _i526;

class DomainPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i604.EndsOnboardingUseCase>(() => _i604.EndsOnboardingUseCase(
        userRepository: gh<_i494.UserRepository>()));
    gh.factory<_i604.FetchOnboardingStatusUseCase>(() =>
        _i604.FetchOnboardingStatusUseCase(
            userRepository: gh<_i494.UserRepository>()));
    gh.factory<_i105.FetchSubscriptionStatusUseCase>(() =>
        _i105.FetchSubscriptionStatusUseCase(
            repository: gh<_i494.SubscriptionRepository>()));
    gh.factory<_i105.FetchPaywallUseCase>(() => _i105.FetchPaywallUseCase(
        repository: gh<_i494.SubscriptionRepository>()));
    gh.factory<_i105.InitializePaywallsUseCase>(() =>
        _i105.InitializePaywallsUseCase(
            repository: gh<_i494.SubscriptionRepository>()));
    gh.factory<_i105.RestorePurchasesUseCase>(() =>
        _i105.RestorePurchasesUseCase(
            repository: gh<_i494.SubscriptionRepository>()));
    gh.factory<_i53.UpdateDocumentUseCase>(() => _i53.UpdateDocumentUseCase(
        repository: gh<_i494.DocumentsRepository>()));
    gh.factory<_i53.FetchDocumentsUseCase>(() => _i53.FetchDocumentsUseCase(
        repository: gh<_i494.DocumentsRepository>()));
    gh.factory<_i53.DeleteDocumentUseCase>(() => _i53.DeleteDocumentUseCase(
        repository: gh<_i494.DocumentsRepository>()));
    gh.factory<_i53.AddDocumentUseCase>(() =>
        _i53.AddDocumentUseCase(repository: gh<_i494.DocumentsRepository>()));
  }
}
