part of documents_usecases;

final class FetchDocumentsUseCase extends FutureUseCase<NoParams, List<DocumentData>?> {
  final DocumentsRepository _repository;

  FetchDocumentsUseCase({
    required DocumentsRepository repository,
  }) : _repository = repository;

  @override
  Future<List<DocumentData>?> execute([NoParams? payload = const NoParams()]) async {
    return _repository.fetchDocuments();
  }
}
