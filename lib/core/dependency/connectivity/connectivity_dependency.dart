import 'package:connectivity/connectivity.dart';
import 'package:injectable/injectable.dart';

@injectable
class ConnectivityDependency {
  Future<ConnectivityResult> checkConnectivity() async {
    try {
      return Connectivity().checkConnectivity();
    } catch (exception) {
      return ConnectivityResult.none;
    }
  }
}
