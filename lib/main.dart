// ignore_for_file: avoid_web_libraries_in_flutter, deprecated_member_use
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'app/app.dart';

void main() {
  String initialLocation = '/';
  try {
    final redirect = html.window.sessionStorage['redirect'];
    if (redirect != null && redirect.isNotEmpty) {
      html.window.sessionStorage.remove('redirect');
      initialLocation = '/$redirect';
    }
  } catch (_) {}

  runApp(VelmiqueBeautyApp(initialLocation: initialLocation));
}
