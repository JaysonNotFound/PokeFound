import 'package:freezed_annotation/freezed_annotation.dart';

import '../remote_failure.dart';

part 'unhandled_failure.freezed.dart';

@freezed
class UnhandledFailure with _$UnhandledFailure implements RemoteFailure {
  factory UnhandledFailure() = _UnhandledFailure;
}
