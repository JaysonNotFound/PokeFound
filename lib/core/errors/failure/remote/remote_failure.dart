import 'package:freezed_annotation/freezed_annotation.dart';

import '../failure.dart';

part 'remote_failure.freezed.dart';

@freezed
class RemoteFailure with _$RemoteFailure implements Failure {
  factory RemoteFailure() = _RemoteFailure;
}
