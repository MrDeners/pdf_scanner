part of 'home_bloc.dart';

class HomeState {
  final List<DocumentData> documents;
  final String sorting;
  final String search;

  final bool isLoading;

  const HomeState({
    required this.isLoading,
    required this.documents,
    required this.sorting,
    required this.search,
  });

  const HomeState.initial()
      : isLoading = false,
        documents = const <DocumentData>[],
        sorting = '-datetime',
        search = '';

  List<DocumentData> get filteredDocuments {
    final List<DocumentData> filtered = documents
        .where(
          (DocumentData document) => document.name.toLowerCase().contains(search.toLowerCase()),
        )
        .toList();

    filtered.sort((DocumentData a, DocumentData b) {
      final bool asc = sorting == 'datetime';
      final int result =
          asc ? a.createdAt.compareTo(b.createdAt) : b.createdAt.compareTo(a.createdAt);

      return result;
    });

    return filtered;
  }

  bool get hasDocuments => filteredDocuments.isNotEmpty;

  bool get isSortHeight => sorting.contains('-');

  HomeState copyWith({
    bool? isLoading,
    List<DocumentData>? documents,
    String? sorting,
    String? search,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      documents: documents ?? this.documents,
      sorting: sorting ?? this.sorting,
      search: search ?? this.search,
    );
  }
}
