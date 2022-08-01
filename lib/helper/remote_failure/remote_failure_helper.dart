import 'package:injectable/injectable.dart';

import '../../core/exception/remote/maintenance_exception.dart';
import '../../core/exception/remote/remote_exception.dart';
import '../../core/exception/remote/timeout_exception.dart';
import '../../core/failure/remote/maintenance/maintenance_failure.dart';
import '../../core/failure/remote/remote_failure.dart';
import '../../core/failure/remote/timeout/timeout_failure.dart';
import '../../core/failure/remote/unhandled/unhandled_failure.dart';

@injectable
class RemoteFailureHelper {
  RemoteFailure call(Exception exception) {
    if (exception is TimeoutException) {
      return TimeoutFailure();
    }

    if (exception is MaintenanceException) {
      return MaintenanceFailure();
    }

    if (exception is RemoteException) {
      return UnhandledFailure();
    }

    return UnhandledFailure();
  }
}
