import 'package:core/core.dart';
import 'package:data/data.dart';

@module
abstract class RevenueCatModule {
  @Named('revenueCatApiKey')
  @singleton
  String get revenueCatApiKey => dotenv.env['REVENUE_CAT_API_KEY'] ?? '';

  @Named('userId')
  @singleton
  String get userId => GetIt.I.get<AppConfig>().deviceId;

  @preResolve
  @singleton
  Future<RevenueCatClient> revenueCatProvider(
    @Named('revenueCatApiKey') String apiKey,
    @Named('userId') String customerUserId,
  ) async {
    return RevenueCatClient(
      apiKey: apiKey,
      customerUserId: customerUserId,
    );
  }
}
