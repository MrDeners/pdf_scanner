part of 'doc_preview_bloc.dart';

class DocPreviewState {
  final DocumentData document;
  final int selectedPage;
  final int pagesAmount;

  final bool isLoading;

  const DocPreviewState({
    required this.document,
    required this.selectedPage,
    required this.pagesAmount,
    required this.isLoading,
  });

  DocPreviewState.initial()
      : isLoading = false,
        selectedPage = 0,
        pagesAmount = 1,
        document = DocumentData(
          file: File(''),
          createdAt: DateTime.now(),
        );

  DocPreviewState copyWith({
    bool? isLoading,
    int? selectedPage,
    int? pagesAmount,
    DocumentData? document,
  }) {
    return DocPreviewState(
      isLoading: isLoading ?? this.isLoading,
      document: document ?? this.document,
      selectedPage: selectedPage ?? this.selectedPage,
      pagesAmount: pagesAmount ?? this.pagesAmount,
    );
  }
}
