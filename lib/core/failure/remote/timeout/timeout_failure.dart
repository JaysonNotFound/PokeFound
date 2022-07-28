import 'package:freezed_annotation/freezed_annotation.dart';

import '../remote_failure.dart';

part 'timeout_failure.freezed.dart';

@freezed
class TimeoutFailure with _$TimeoutFailure implements RemoteFailure {
  factory TimeoutFailure() = _TimeoutFailure;
}
