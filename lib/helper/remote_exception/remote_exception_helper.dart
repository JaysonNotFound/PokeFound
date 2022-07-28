import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/data/model/error_response_model.dart';
import '../../core/exception/maintenance_exception.dart';
import '../../core/exception/network_exception.dart';
import '../../core/exception/remote_exception.dart';
import '../../core/exception/timeout_exception.dart';
import '../../core/exception/unknown_exception.dart';

@injectable
class RemoteExceptionHelper {
  Response<dynamic> assureRemoteException(dynamic error) {
    if (error is DioError && (error.response?.statusCode == 503)) {
      throw const MaintenanceException();
    }

    if (error is DioError && error.type == DioErrorType.connectTimeout) {
      throw const TimeoutException();
    }

    if (error.type == DioErrorType.other &&
        error.error != null &&
        error.error is SocketException) {
      throw const NetworkException();
    }

    if (error.response == null) {
      throw const UnknownException();
    }

    Response response = error.response;

    if (response.data == null || response.data == '') {
      throw RemoteException(
        response.statusCode,
        null,
      );
    }

    if (response.data is! Map<String, dynamic>) {
      throw RemoteException(
        response.statusCode,
        null,
      );
    }

    throw RemoteException(
      response.statusCode,
      ErrorResponseModel.fromJson(response.data),
    );
  }
}
