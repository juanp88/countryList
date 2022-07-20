import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launch_maps(url) async {
  Uri _url = Uri.parse(url);

  debugPrint(_url.toString());

  if (!await launchUrl(
    _url,
    mode: LaunchMode.inAppWebView,
  )) {
    throw 'Could not launch $_url';
  }
}
