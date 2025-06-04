import 'package:url_launcher/url_launcher.dart';

final class UrlService {
  static const String _mailScheme = 'mailto';

  static Future<void> launch(String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  static Future<void> launchEmail(String email) async {
    final Uri uri = Uri(
      scheme: _mailScheme,
      path: email,
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
