part of subscription_usecases;

final class InitializePaywallsUseCase extends FutureUseCase<NoParams, void> {
  final SubscriptionRepository _repository;

  InitializePaywallsUseCase({
    required SubscriptionRepository repository,
  }) : _repository = repository;

  @override
  Future<void> execute([NoParams payload = const NoParams()]) async {
    return _repository.initializeOfferings();
  }
}
