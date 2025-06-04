import 'dart:async';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/foundation.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AppEventObserver _appEventObserver;

  StreamSubscription<CoreUiEvent>? _coreUiEventsSubscription;

  AppBloc({
    required AppEventObserver appEventObserver,
  })  : _appEventObserver = appEventObserver,
        super(const AppState.initial()) {
    on<CoreUiEventReceived>(_onCoreUiEventReceived);
    on<Clear>(_onClear);

    _coreUiEventsSubscription = _appEventObserver.observe<CoreUiEvent>(
      (CoreUiEvent event) => add(CoreUiEventReceived(event)),
    );
  }

  void _onCoreUiEventReceived(
    CoreUiEventReceived event,
    Emitter<AppState> emit,
  ) {
    final CoreUiEvent data = event.data;

    switch (data) {
      case ShowToast():
        emit(
          state.copyWith(
            toastMessage: kDebugMode ? data.error ?? data.message : data.message,
            toastType: data.type,
          ),
        );
    }
  }

  void _onClear(
    Clear event,
    Emitter<AppState> emit,
  ) {
    emit(
      state.copyWith(
        toastMessage: '',
        toastType: ToastType.error,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _coreUiEventsSubscription?.cancel();
    await super.close();
  }
}
