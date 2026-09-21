import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

abstract final class UrlLauncherHelper {
  static Future<void> openExternal(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, webOnlyWindowName: '_blank')) {
      debugPrint('Could not launch $url');
    }
  }

  static Future<void> openEmail(String email, {String? subject}) async {
    final uri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: subject == null ? null : {'subject': subject},
    );

    if (!await launchUrl(uri)) {
      debugPrint('Could not launch email client for $email');
    }
  }
}
