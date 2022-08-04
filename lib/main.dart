import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'app.dart';
import 'core/config/dependency_locator.dart';
import 'core/http/http_client_override.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = HttpClientOverrides();

  await initialize();
  runZonedGuarded(
    () {
      runApp(const App());
    },
    (error, stackTrace) {
      // TODO: Add Crashlytics record error.
    },
  );
}
