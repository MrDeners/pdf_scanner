part of documents_usecases;

final class UpdateDocumentUseCase extends FutureUseCase<DocumentData, void> {
  final DocumentsRepository _repository;

  UpdateDocumentUseCase({
    required DocumentsRepository repository,
  }) : _repository = repository;

  @override
  Future<void> execute(DocumentData payload) async {
    return _repository.updateDocument(payload);
  }
}
