part of documents_usecases;

final class AddDocumentUseCase extends FutureUseCase<File, void> {
  final DocumentsRepository _repository;

  AddDocumentUseCase({
    required DocumentsRepository repository,
  }) : _repository = repository;

  @override
  Future<void> execute(File payload) async {
    return _repository.addDocument(payload);
  }
}
