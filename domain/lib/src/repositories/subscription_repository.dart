part of repositories;

abstract interface class SubscriptionRepository {
  Future<void> initializeOfferings();

  Future<Offering?> fetchOffering(String placement);

  Future<bool> fetchSubscriptionStatus();

  Future<bool> restorePurchases();
}
