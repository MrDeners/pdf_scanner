import 'dart:async';
import 'dart:io';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AppRouter _appRouter;
  final AppEventNotifier _appEventNotifier;
  final FetchSubscriptionStatusUseCase _fetchSubscriptionStatusUseCase;
  final FetchDocumentsUseCase _fetchDocumentsUseCase;
  final DeleteDocumentUseCase _deleteDocumentUseCase;
  final AddDocumentUseCase _addDocumentUseCase;

  HomeBloc({
    required AppRouter appRouter,
    required AppEventNotifier appEventNotifier,
    required FetchSubscriptionStatusUseCase fetchSubscriptionStatusUseCase,
    required FetchDocumentsUseCase fetchDocumentsUseCase,
    required DeleteDocumentUseCase deleteDocumentUseCase,
    required AddDocumentUseCase addDocumentUseCase,
  })  : _appRouter = appRouter,
        _appEventNotifier = appEventNotifier,
        _fetchSubscriptionStatusUseCase = fetchSubscriptionStatusUseCase,
        _fetchDocumentsUseCase = fetchDocumentsUseCase,
        _deleteDocumentUseCase = deleteDocumentUseCase,
        _addDocumentUseCase = addDocumentUseCase,
        super(const HomeState.initial()) {
    on<Initialize>(_onInitialize);
    on<ChangeSearch>(_onChangeSearch);
    on<SortByDateTime>(_onSortByDateTime);
    on<NavigateDocRename>(_onNavigateDocRename);
    on<NavigatePreview>(_onNavigatePreview);
    on<Print>(_onPrint);
    on<Scan>(_onScan);
    on<Share>(_onShare);
    on<Delete>(_onDelete);
  }

  Future<void> _onInitialize(
    Initialize event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true),
    );

    try {
      final List<DocumentData>? result = await _fetchDocumentsUseCase.execute();

      emit(
        state.copyWith(documents: result ?? <DocumentData>[]),
      );
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

  Future<void> _onChangeSearch(
    ChangeSearch event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(search: event.value),
    );
  }

  Future<void> _onSortByDateTime(
    SortByDateTime event,
    Emitter<HomeState> emit,
  ) async {
    const String key = 'datetime';
    const String keyReversed = '-datetime';

    emit(
      state.copyWith(sorting: state.sorting == key ? keyReversed : key),
    );
  }

  Future<void> _onPrint(
    Print event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true),
    );

    try {
      final bool hasSubscription = await _fetchSubscriptionStatusUseCase.execute();

      if (!hasSubscription) {
        await _appRouter.navigatePaywall(PaywallPlacements.print_v1.name);

        final bool hasSubscription = await _fetchSubscriptionStatusUseCase.execute();
        if (!hasSubscription) return;
      }

      await PrintService.printDocument(state.documents[event.index].file);
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

  Future<void> _onScan(
    Scan event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true),
    );

    try {
      final List<String>? paths = await ScanService.scan();
      if (paths == null || paths.isEmpty) return;

      final File file = await FileService.createPdfFromImages(paths);

      await _addDocumentUseCase.execute(file);
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

    add(const Initialize());
  }

  Future<void> _onNavigateDocRename(
    NavigateDocRename event,
    Emitter<HomeState> emit,
  ) async {
    await _appRouter.navigateDocRename(state.filteredDocuments[event.index]);

    add(const Initialize());
  }

  Future<void> _onNavigatePreview(
    NavigatePreview event,
    Emitter<HomeState> emit,
  ) async {
    await _appRouter.navigateDocPreview(state.filteredDocuments[event.index]);

    add(const Initialize());
  }

  Future<void> _onShare(
    Share event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true),
    );

    try {
      final bool hasSubscription = await _fetchSubscriptionStatusUseCase.execute();

      if (!hasSubscription) {
        await _appRouter.navigatePaywall(PaywallPlacements.share_v1.name);

        final bool hasSubscription = await _fetchSubscriptionStatusUseCase.execute();
        if (!hasSubscription) return;
      }

      await ShareService.shareFile(state.filteredDocuments[event.index].file);
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

  Future<void> _onDelete(
    Delete event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true),
    );

    try {
      await _deleteDocumentUseCase.execute(state.filteredDocuments[event.index]);
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

    add(const Initialize());
  }
}
