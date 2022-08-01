import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../helper/remote_exception/data/model/error_response_model.dart';

part 'remote_exception.freezed.dart';

@freezed
class RemoteException with _$RemoteException implements Exception {
  factory RemoteException({
    int? statusCode,
    ErrorResponseModel? errorResponseModel,
  }) = _RemoteException;
}
