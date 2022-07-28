import 'package:equatable/equatable.dart';

import '../errors/data/model/error_response_model.dart';

class RemoteException extends Equatable implements Exception {
  const RemoteException(
    this.statusCode,
    this.errorResponseModel,
  );

  final int? statusCode;
  final ErrorResponseModel? errorResponseModel;

  @override
  List<Object?> get props => [statusCode, errorResponseModel];
}
