part of subscription_usecases;

final class RestorePurchasesUseCase extends FutureUseCase<NoParams, bool> {
  final SubscriptionRepository _repository;

  RestorePurchasesUseCase({
    required SubscriptionRepository repository,
  }) : _repository = repository;

  @override
  Future<bool> execute([NoParams payload = const NoParams()]) {
    return _repository.restorePurchases();
  }
}
