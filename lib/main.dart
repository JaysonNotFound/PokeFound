import 'dart:async';

import 'package:flutter/material.dart';

import 'app.dart';
import 'core/config/dependency_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
