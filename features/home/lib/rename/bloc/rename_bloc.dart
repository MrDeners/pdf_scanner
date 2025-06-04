import 'dart:async';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'rename_event.dart';
part 'rename_state.dart';

class RenameBloc extends Bloc<RenameEvent, RenameState> {
  final AppRouter _appRouter;
  final AppEventNotifier _appEventNotifier;
  final UpdateDocumentUseCase _updateDocumentUseCase;

  RenameBloc({
    required DocumentData document,
    required AppRouter appRouter,
    required AppEventNotifier appEventNotifier,
    required UpdateDocumentUseCase updateDocumentUseCase,
  })  : _appRouter = appRouter,
        _appEventNotifier = appEventNotifier,
        _updateDocumentUseCase = updateDocumentUseCase,
        super(RenameState.initial(document)) {
    on<ChangeName>(_onChangeName);
    on<Save>(_onSave);
    on<NavigateBack>(_onNavigateBack);
  }

  Future<void> _onChangeName(
    ChangeName event,
    Emitter<RenameState> emit,
  ) async {
    emit(
      state.copyWith(name: event.value),
    );
  }

  Future<void> _onSave(
    Save event,
    Emitter<RenameState> emit,
  ) async {
    if (state.name == state.document.name) return;

    emit(
      state.copyWith(isLoading: true),
    );

    try {
      final DocumentData document = state.document.copyWith(name: state.name);

      await _updateDocumentUseCase.execute(document);

      await _appRouter.navigateBack();
    } catch (error) {
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
    Emitter<RenameState> emit,
  ) async {
    await _appRouter.navigateBack();
  }
}
