enum Flavor {
  prod,
  dev,
}

class AppConfig {
  final Flavor flavor;
  final String deviceId;

  AppConfig({
    required this.flavor,
    required this.deviceId,
  });

  factory AppConfig.fromFlavor(
    Flavor flavor, {
    required String deviceId,
  }) {
    switch (flavor) {
      case Flavor.prod:
        break;

      case Flavor.dev:
        break;
    }

    return AppConfig(
      flavor: flavor,
      deviceId: deviceId,
    );
  }
}
