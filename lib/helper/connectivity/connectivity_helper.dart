import 'package:connectivity/connectivity.dart';
import 'package:injectable/injectable.dart';

import '../../core/dependency/connectivity/connectivity_dependency.dart';

@injectable
class ConnectivityHelper {
  final ConnectivityDependency _connectivityDependency;

  ConnectivityHelper({
    required ConnectivityDependency connectivityDependency,
  }) : _connectivityDependency = connectivityDependency;

  Future<bool> checkConnectivity() async {
    final result = await _connectivityDependency.checkConnectivity();
    return result != ConnectivityResult.none;
  }
}
