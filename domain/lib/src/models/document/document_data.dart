part of document_models;

@freezed
abstract class DocumentData extends Equatable with _$DocumentData {
  const factory DocumentData({
    @Default(null) int? id,
    @FileConverter() required File file,
    required DateTime createdAt,
    @Default('') String name,
    @Default(1) int pagesAmount,
  }) = _DocumentData;

  const DocumentData._();

  factory DocumentData.fromJson(Map<String, dynamic> json) => _$DocumentDataFromJson(json);

  @override
  List<Object?> get props => <Object?>[
        id,
        file,
        name,
        pagesAmount,
        createdAt,
      ];
}
