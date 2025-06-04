import 'package:flutter/services.dart';

abstract final class ScreenService {
  static Future<void> setPreferredOrientation() async {
    await SystemChrome.setPreferredOrientations(
      const <DeviceOrientation>[DeviceOrientation.portraitUp],
    );
  }
}
