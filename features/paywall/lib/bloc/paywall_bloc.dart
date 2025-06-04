import 'dart:async';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:navigation/navigation.dart';

part 'paywall_event.dart';
part 'paywall_state.dart';

class PaywallBloc extends Bloc<PaywallEvent, PaywallState> {
  final AppRouter _appRouter;
  final AppEventNotifier _appEventNotifier;
  final FetchPaywallUseCase _fetchOfferingUsecase;
  final RestorePurchasesUseCase _restorePurchasesUsecase;

  PaywallBloc(
      {required AppRouter appRouter,
      required AppEventNotifier appEventNotifier,
      required FetchPaywallUseCase fetchOfferingUsecase,
      required RestorePurchasesUseCase restorePurchasesUsecase})
      : _appRouter = appRouter,
        _appEventNotifier = appEventNotifier,
        _fetchOfferingUsecase = fetchOfferingUsecase,
        _restorePurchasesUsecase = restorePurchasesUsecase,
        super(const PaywallState.initial()) {
    on<Initialize>(_onInitialize);
    on<MakePurchase>(_onMakePurchase);
    on<ChangeSelectedIndex>(_onChangeSelectedIndex);
    on<OpenPrivacy>(_onOpenPrivacy);
    on<OpenTerms>(_onOpenTerms);
    on<Restore>(_onRestore);
    on<NavigateBack>(_onNavigateBack);
  }

  Future<void> _onInitialize(
    Initialize event,
    Emitter<PaywallState> emit,
  ) async {
    try {
      emit(
        state.copyWith(isLoading: true),
      );
      //TODO: Uncomment after adding api key
      // final Offering? offering = await _fetchOfferingUsecase.execute(event.value);
      //
      // emit(
      //   state.copyWith(offering: offering),
      // );
    } catch (_) {
      _appEventNotifier.notify(
        ShowToast(
          message: LocaleKeys.errors_unknown.tr(),
          type: ToastType.error,
        ),
      );
    } finally {
      emit(
        state.copyWith(isLoading: false),
      );
    }
  }

  Future<void> _onMakePurchase(
    MakePurchase event,
    Emitter<PaywallState> emit,
  ) async {
    try {
      emit(
        state.copyWith(isLoading: true),
      );
      final Package? package = state.offering?.availablePackages[state.selectedIndex];

      if (package == null) return;

      await Purchases.purchasePackage(package);
    } catch (_) {
      _appEventNotifier.notify(
        ShowToast(
          message: LocaleKeys.errors_unknown.tr(),
          type: ToastType.error,
        ),
      );
    } finally {
      emit(
        state.copyWith(isLoading: false),
      );
    }
  }

  Future<void> _onChangeSelectedIndex(
    ChangeSelectedIndex event,
    Emitter<PaywallState> emit,
  ) async {
    emit(
      state.copyWith(selectedIndex: event.value),
    );

    add(const MakePurchase());
  }

  Future<void> _onOpenTerms(
    OpenTerms event,
    Emitter<PaywallState> emit,
  ) async {
    await UrlService.launch(AppConstants.termsConditionsUrl);
  }

  Future<void> _onOpenPrivacy(
    OpenPrivacy event,
    Emitter<PaywallState> emit,
  ) async {
    await UrlService.launch(AppConstants.privacyUrl);
  }

  Future<void> _onRestore(
    Restore event,
    Emitter<PaywallState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true),
    );
    try {
      final bool result = await _restorePurchasesUsecase.execute();

      if (!result) {
        await event.onFailure();
      }
    } catch (_) {
      _appEventNotifier.notify(
        ShowToast(
          message: LocaleKeys.errors_unknown.tr(),
          type: ToastType.error,
        ),
      );
    } finally {
      emit(
        state.copyWith(isLoading: false),
      );
    }
  }

  Future<void> _onNavigateBack(
    NavigateBack event,
    Emitter<PaywallState> emit,
  ) async {
    await _appRouter.navigateBack();
  }
}
