import 'package:freezed_annotation/freezed_annotation.dart';

part 'maintenance_exception.freezed.dart';

@freezed
class MaintenanceException with _$MaintenanceException implements Exception {
  factory MaintenanceException() = _MaintenanceException;
}
