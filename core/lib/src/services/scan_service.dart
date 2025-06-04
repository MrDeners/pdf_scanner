import 'package:core/src/services/permission_handler.dart';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

abstract final class ScanService {
  static Future<List<String>?> scan() async {
    final bool result = await PermissionHandler.getCameraPermission();
    if (result) {
      final List<String>? paths = await CunningDocumentScanner.getPictures();

      return paths;
    } else {
      await openAppSettings();

      return null;
    }
  }
}
