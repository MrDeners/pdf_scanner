part of repositories;

@Singleton(as: SubscriptionRepository)
final class SubscriptionRepositoryImpl implements SubscriptionRepository {
  final RevenueCatClient _revenueCatProvider;

  Offerings get _offerings => _revenueCatProvider.offerings;

  const SubscriptionRepositoryImpl({
    required RevenueCatClient adaptyProvider,
  }) : _revenueCatProvider = adaptyProvider;

  @override
  Future<void> initializeOfferings() async {
    await _revenueCatProvider.initializeOfferings();
  }

  @override
  Future<bool> fetchSubscriptionStatus() {
    return _revenueCatProvider.fetchSubscriptionStatus(SubscriptionConstants.premiumLevelKey);
  }

  @override
  Future<bool> restorePurchases() {
    return _revenueCatProvider.restorePurchases(SubscriptionConstants.premiumLevelKey);
  }

  @override
  Future<Offering?> fetchOffering(String placement) async {
    final Offering? currentOffering = _offerings.getOffering(placement);

    return currentOffering;
  }
}
