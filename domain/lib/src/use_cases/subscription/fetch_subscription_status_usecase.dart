part of subscription_usecases;

final class FetchSubscriptionStatusUseCase extends FutureUseCase<NoParams, bool> {
  final SubscriptionRepository _repository;

  FetchSubscriptionStatusUseCase({
    required SubscriptionRepository repository,
  }) : _repository = repository;

  @override
  Future<bool> execute([NoParams payload = const NoParams()]) {
    return _repository.fetchSubscriptionStatus();
  }
}
