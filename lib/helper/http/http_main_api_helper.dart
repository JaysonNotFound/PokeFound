import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/enum/http/content_type.dart';
import 'http_client_helper.dart';

@injectable
class HttpMainApiHelper {
  final HttpClientHelper _httpHelper;

  HttpMainApiHelper({
    required HttpClientHelper httpHelper,
  }) : _httpHelper = httpHelper;

  static const String mainApiUrl = 'https://localhost/api:3000';

  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    ContentType contentType = ContentType.json,
    ResponseType responseType = ResponseType.plain,
    bool shouldRetry = true,
  }) async {
    final httpClient = _httpHelper.getClient(
      baseUrl: mainApiUrl,
      contentType: contentType,
      responseType: responseType,
      shouldRetry: shouldRetry,
    );

    return await httpClient.get(
      path,
      queryParameters: queryParameters,
    );
  }

  Future<Response<dynamic>> post(
    String path, {
    dynamic data,
    ContentType contentType = ContentType.json,
    ResponseType responseType = ResponseType.plain,
    bool shouldRetry = true,
  }) async {
    final httpClient = _httpHelper.getClient(
      baseUrl: mainApiUrl,
      contentType: contentType,
      responseType: responseType,
      shouldRetry: shouldRetry,
    );

    return await httpClient.post(
      path,
      data: data,
    );
  }

  Future<Response<dynamic>> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    ContentType contentType = ContentType.json,
    ResponseType responseType = ResponseType.plain,
    bool shouldRetry = true,
  }) async {
    final httpClient = _httpHelper.getClient(
      baseUrl: mainApiUrl,
      contentType: contentType,
      responseType: responseType,
      shouldRetry: shouldRetry,
    );

    return await httpClient.delete(
      path,
      queryParameters: queryParameters,
    );
  }

  Future<Response<dynamic>> put(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    ContentType contentType = ContentType.json,
    ResponseType responseType = ResponseType.plain,
    bool shouldRetry = true,
  }) async {
    final httpClient = _httpHelper.getClient(
      baseUrl: mainApiUrl,
      contentType: contentType,
      responseType: responseType,
      shouldRetry: shouldRetry,
    );

    return await httpClient.put(
      path,
      data: data,
      queryParameters: queryParameters,
    );
  }
}
