part of repositories;

@Singleton(as: DocumentsRepository)
final class DocumentsRepositoryImpl implements DocumentsRepository {
  final LocalDatabaseProvider _localDatabaseProvider;

  const DocumentsRepositoryImpl({
    required LocalDatabaseProvider localDatabaseProvider,
  }) : _localDatabaseProvider = localDatabaseProvider;

  @override
  Future<void> addDocument(File value) async {
    final File file = await FileService.saveFile(value);
    final String name = file.path.split('/').last;
    final int pagesAmount = await FileService.getPagesAmount(file);

    final DocumentData document = DocumentData(
      name: name,
      file: file,
      pagesAmount: pagesAmount,
      createdAt: DateTime.now(),
    );

    final DocumentsTableCompanion companion = DocumentsTableMapper.toCompanion(document);

    await _localDatabaseProvider.into(_localDatabaseProvider.documentsTable).insert(companion);
  }

  @override
  Future<void> deleteDocument(DocumentData value) async {
    if (value.id == null) throw AppException(message: LocaleKeys.errors_unknown.tr());

    await (_localDatabaseProvider.delete(_localDatabaseProvider.documentsTable)
          ..where(($DocumentsTableTable tbl) => tbl.id.equals(value.id ?? -1)))
        .go();

    await value.file.delete();
  }

  @override
  Future<List<DocumentData>?> fetchDocuments() async {
    final List<DocumentsTableData> rows =
        await _localDatabaseProvider.select(_localDatabaseProvider.documentsTable).get();

    final List<DocumentData> result = rows.map(DocumentsTableMapper.fromRow).toList();

    return result;
  }

  @override
  Future<void> updateDocument(DocumentData value) async {
    if (value.id == null) throw AppException(message: LocaleKeys.errors_unknown.tr());

    final DocumentsTableCompanion companion = DocumentsTableMapper.toCompanion(value);

    await (_localDatabaseProvider.update(_localDatabaseProvider.documentsTable)
          ..where(($DocumentsTableTable tbl) => tbl.id.equals(value.id ?? -1)))
        .write(companion);
  }
}
