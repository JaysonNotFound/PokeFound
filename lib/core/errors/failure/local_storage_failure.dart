import 'package:freezed_annotation/freezed_annotation.dart';

import 'failure.dart';

part 'local_storage_failure.freezed.dart';

@freezed
class LocalStorageFailure with _$LocalStorageFailure implements Failure {
  factory LocalStorageFailure() = _LocalStorageFailure;
}
