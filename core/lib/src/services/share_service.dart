import 'dart:async';
import 'dart:io';

import 'package:share_plus/share_plus.dart';

final class ShareService {
  static Future<void> shareFile(File file) async {
    final XFile xFile = XFile(
      file.path,
      mimeType: 'application/pdf',
    );

    await SharePlus.instance.share(
      ShareParams(files: <XFile>[xFile]),
    );
  }
}
