import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'dependency_locator.config.dart';

GetIt locator = GetIt.instance;

@injectableInit
Future<void> configure() async => $initGetIt(locator);
