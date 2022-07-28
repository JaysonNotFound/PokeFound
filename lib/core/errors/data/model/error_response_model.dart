import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_response_model.g.dart';

@JsonSerializable()
class ErrorResponseModel extends Equatable {
  const ErrorResponseModel(
    this.message,
    this.code,
    this.errors,
  );

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseModelToJson(this);

  final String? message;
  final int? code;
  final Map<String, dynamic>? errors;

  @override
  List<Object?> get props => [
        message,
        code,
        errors,
      ];
}
