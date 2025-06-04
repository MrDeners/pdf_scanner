import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  static Future<bool> getCameraPermission() async {
    final bool isCameraAvailable = await Permission.camera.isGranted;

    if (isCameraAvailable) return true;

    final PermissionStatus permissionStatus = await Permission.camera.request();

    if (permissionStatus.isPermanentlyDenied) {
      await openAppSettings();
    }

    return permissionStatus.isGranted;
  }
}
