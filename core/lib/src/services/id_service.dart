import 'package:core/core.dart';

abstract final class IdService {
  static Future<String> get deviceId async => Fcuuid.instance.uuidForDevice();
}
