part of 'providers.dart';

class RevenueCatClient {
  late Offerings offerings;

  final String customerUserId;

  RevenueCatClient({
    required this.customerUserId,
    required String apiKey,
  }) {
    //TODO: Uncomment after adding api key
    // _initialize(apiKey);
  }

  Future<void> _initialize(String apiKey) async {
    await Purchases.setLogLevel(LogLevel.verbose);

    PurchasesConfiguration configuration;
    configuration = PurchasesConfiguration(apiKey)..appUserID = customerUserId;

    await Purchases.configure(configuration);
  }

  Future<void> initializeOfferings() async {
    offerings = await Purchases.getOfferings();
  }

  Future<bool> fetchSubscriptionStatus(String level) async {
    //TODO: Uncomment after adding api key
    // final CustomerInfo customerInfo = await Purchases.getCustomerInfo();
    //
    // final EntitlementInfo? entitlement = customerInfo.entitlements.all[level];
    // final bool result = entitlement != null && entitlement.isActive;
    //
    // return result;
    return false;
  }

  Future<bool> restorePurchases(String level) async {
    //TODO: Uncomment after adding api key
    // final CustomerInfo restoredInfo = await Purchases.restorePurchases();
    //
    // final EntitlementInfo? entitlement = restoredInfo.entitlements.all[level];
    // final bool result = entitlement?.isActive ?? false;
    //
    // return result;
    return false;
  }
}
