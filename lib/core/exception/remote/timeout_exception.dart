import 'package:freezed_annotation/freezed_annotation.dart';

part 'timeout_exception.freezed.dart';

@freezed
class TimeoutException with _$TimeoutException implements Exception {
  factory TimeoutException() = _TimeoutException;
}
