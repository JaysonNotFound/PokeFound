import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/exception/remote/maintenance_exception.dart';
import '../../core/exception/remote/network_exception.dart';
import '../../core/exception/remote/remote_exception.dart';
import '../../core/exception/remote/timeout_exception.dart';
import '../../core/exception/remote/unknown_exception.dart';
import 'data/model/error_response_model.dart';

@injectable
class RemoteExceptionHelper {
  Response<dynamic> assureRemoteException(dynamic error) {
    if (error is DioError && (error.response?.statusCode == 503)) {
      throw MaintenanceException();
    }

    if (error is DioError && error.type == DioErrorType.connectTimeout) {
      throw TimeoutException();
    }

    if (error.type == DioErrorType.other &&
        error.error != null &&
        error.error is SocketException) {
      throw NetworkException();
    }

    if (error.response == null) {
      throw UnknownException();
    }

    Response response = error.response;

    if (response.data == null || response.data == '') {
      throw RemoteException(
        statusCode: response.statusCode,
        errorResponseModel: null,
      );
    }

    if (response.data is! Map<String, dynamic>) {
      throw RemoteException(
        statusCode: response.statusCode,
        errorResponseModel: null,
      );
    }

    throw RemoteException(
      statusCode: response.statusCode,
      errorResponseModel: ErrorResponseModel.fromJson(response.data),
    );
  }
}
