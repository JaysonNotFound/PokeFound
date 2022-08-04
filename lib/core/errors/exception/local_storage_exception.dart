import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_storage_exception.freezed.dart';

@freezed
class LocalStorageException with _$LocalStorageException implements Exception {
  factory LocalStorageException() = _LocalStorageException;
}
