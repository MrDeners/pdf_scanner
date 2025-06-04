part of repositories;

abstract interface class DocumentsRepository {
  Future<List<DocumentData>?> fetchDocuments();

  Future<void> updateDocument(DocumentData document);

  Future<void> addDocument(File file);

  Future<void> deleteDocument(DocumentData document);
}
