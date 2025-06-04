part of 'rename_bloc.dart';

class RenameState {
  final DocumentData document;
  final String name;

  final bool isLoading;

  const RenameState({
    required this.isLoading,
    required this.document,
    required this.name,
  });

  RenameState.initial(DocumentData value)
      : isLoading = false,
        document = value,
        name = value.name;

  RenameState copyWith({
    bool? isLoading,
    DocumentData? document,
    String? name,
  }) {
    return RenameState(
      isLoading: isLoading ?? this.isLoading,
      document: document ?? this.document,
      name: name ?? this.name,
    );
  }
}
