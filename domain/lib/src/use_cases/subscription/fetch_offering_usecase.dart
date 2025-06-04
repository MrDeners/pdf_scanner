part of subscription_usecases;

final class FetchPaywallUseCase extends FutureUseCase<String, Offering?> {
  final SubscriptionRepository _repository;

  FetchPaywallUseCase({
    required SubscriptionRepository repository,
  }) : _repository = repository;

  @override
  Future<Offering?> execute(String payload) {
    return _repository.fetchOffering(payload);
  }
}
