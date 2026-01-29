import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

sealed class ExternalLinks {
  static Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);
    final ok = await launchUrl(
      uri,
      mode: LaunchMode.platformDefault,
      webOnlyWindowName: '_blank',
    );
    if (!ok && kDebugMode) {
      // Intentionally no user-facing error; safe no-op in production.
      // ignore: avoid_print
      print('Could not launch $url');
    }
  }

  static Future<void> openEmail(String email) async {
    final uri = Uri(scheme: 'mailto', path: email);
    await launchUrl(uri);
  }
}
