import 'dart:io';
import 'dart:typed_data';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'doc_preview_event.dart';
part 'doc_preview_state.dart';

class DocPreviewBloc extends Bloc<DocPreviewEvent, DocPreviewState> {
  final AppRouter _appRouter;
  final AppEventNotifier _appEventNotifier;
  final FetchSubscriptionStatusUseCase _fetchSubscriptionStatusUseCase;
  final UpdateDocumentUseCase _updateDocumentUseCase;

  DocPreviewBloc({
    required AppRouter appRouter,
    required AppEventNotifier appEventNotifier,
    required FetchSubscriptionStatusUseCase fetchSubscriptionStatusUseCase,
    required UpdateDocumentUseCase updateDocumentUseCase,
  })  : _appRouter = appRouter,
        _appEventNotifier = appEventNotifier,
        _fetchSubscriptionStatusUseCase = fetchSubscriptionStatusUseCase,
        _updateDocumentUseCase = updateDocumentUseCase,
        super(DocPreviewState.initial()) {
    on<Initialize>(_onInitialize);
    on<Share>(_onShare);
    on<Edit>(_onEdit);
    on<Add>(_onAdd);
    on<NavigateBack>(_onNavigateBack);
    on<ChangeSelectedPageIndex>(_onChangeSelectedPageIndex);
  }

  Future<void> _onInitialize(
    Initialize event,
    Emitter<DocPreviewState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true),
    );

    try {
      final int pageAmount = await FileService.getPagesAmount(event.document.file);

      emit(
        state.copyWith(
          document: event.document,
          pagesAmount: pageAmount,
        ),
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

  Future<void> _onShare(
    Share event,
    Emitter<DocPreviewState> emit,
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

      await ShareService.shareFile(state.document.file);
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

  Future<void> _onAdd(
    Add event,
    Emitter<DocPreviewState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true),
    );

    late final DocumentData document;

    try {
      final List<String>? paths = await ScanService.scan();
      if (paths == null || paths.isEmpty) return;

      final File file = await FileService.createPdfFromImages(paths);
      final File mergedFile = await FileService.mergePdfFiles(state.document.file, file);
      final File savedFile = await FileService.saveFile(mergedFile);

      await file.delete();

      document = state.document.copyWith(file: savedFile);

      await _updateDocumentUseCase.execute(document);
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

    add(Initialize(document));
  }

  Future<void> _onEdit(
    Edit event,
    Emitter<DocPreviewState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true),
    );

    late final DocumentData document;

    try {
      final Uint8List bytes = await FileService.getPageAsBytes(
        state.document.file,
        state.selectedPage + 1,
      );

      final Uint8List? result = await _appRouter.navigateImageEditor(bytes);

      if (result == null) return;

      final File replacedFile = await FileService.replacePagePdf(
        originalFile: state.document.file,
        pageNumberToReplace: state.selectedPage + 1,
        replacementImageBytes: result,
      );

      final File savedFile = await FileService.saveFile(replacedFile);

      document = state.document.copyWith(file: savedFile);

      await _updateDocumentUseCase.execute(document);
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

    add(Initialize(document));
  }

  Future<void> _onNavigateBack(
    NavigateBack event,
    Emitter<DocPreviewState> emit,
  ) async {
    await _appRouter.navigateBack();
  }

  Future<void> _onChangeSelectedPageIndex(
    ChangeSelectedPageIndex event,
    Emitter<DocPreviewState> emit,
  ) async {
    if (state.selectedPage == event.value) return;

    emit(
      state.copyWith(selectedPage: event.value),
    );
  }
}
