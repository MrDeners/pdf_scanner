part of documents_usecases;

final class DeleteDocumentUseCase extends FutureUseCase<DocumentData, void> {
  final DocumentsRepository _repository;

  DeleteDocumentUseCase({
    required DocumentsRepository repository,
  }) : _repository = repository;

  @override
  Future<void> execute(DocumentData payload) async {
    return _repository.deleteDocument(payload);
  }
}
