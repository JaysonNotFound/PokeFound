import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_failure.freezed.dart';

@freezed
class RemoteFailure with _$RemoteFailure {
  factory RemoteFailure() = _RemoteFailure;
}
