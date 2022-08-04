import 'package:freezed_annotation/freezed_annotation.dart';

import '../remote_failure.dart';

part 'maintenance_failure.freezed.dart';

@freezed
class MaintenanceFailure with _$MaintenanceFailure implements RemoteFailure {
  factory MaintenanceFailure() = _MaintenanceFailure;
}
