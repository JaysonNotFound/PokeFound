import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/dependency/dio/dio_dependency.dart';
import '../../core/enum/http/content_type.dart';
import 'interceptor/http_json_request_interceptor.dart';

@injectable
class HttpClient {
  final DioDependency _dioDependency;
  final HttpJsonRequestInterceptor _jsonHttpRequestInterceptor;

  HttpClient({
    required DioDependency dioDependency,
    required HttpJsonRequestInterceptor jsonHttpRequestInterceptor,
  })  : _dioDependency = dioDependency,
        _jsonHttpRequestInterceptor = jsonHttpRequestInterceptor;

  static const String mainApiUrl = 'https://localhost/api:3000';

  Dio _getClient({
    required String baseUrl,
    required bool shouldRetry,
    required ResponseType responseType,
    ContentType? contentType,
  }) {
    final httpClient = _dioDependency.getBaseHttpClient(baseUrl: baseUrl);
    httpClient.options.contentType = _getContentType(contentType);
    httpClient.options.responseType = responseType;

    if (shouldRetry) {
      const timeOutInMilliseconds = 1000 * 30;
      httpClient.options.connectTimeout = timeOutInMilliseconds;
      httpClient.options.sendTimeout = timeOutInMilliseconds;
      httpClient.options.receiveTimeout = timeOutInMilliseconds;
    }

    if (contentType == ContentType.json) {
      httpClient.interceptors.add(_jsonHttpRequestInterceptor);
    }

    return httpClient;
  }

  String _getContentType(ContentType? contentType) {
    if (contentType == ContentType.json) return 'application/json';
    return '';
  }

  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    String baseUrl = mainApiUrl,
    ContentType contentType = ContentType.json,
    ResponseType responseType = ResponseType.plain,
    bool shouldRetry = true,
  }) async {
    final httpClient = _getClient(
      baseUrl: baseUrl,
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
    String baseUrl = mainApiUrl,
    ContentType contentType = ContentType.json,
    ResponseType responseType = ResponseType.plain,
    bool shouldRetry = true,
  }) async {
    final httpClient = _getClient(
      baseUrl: baseUrl,
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
    String baseUrl = mainApiUrl,
    ContentType contentType = ContentType.json,
    ResponseType responseType = ResponseType.plain,
    bool shouldRetry = true,
  }) async {
    final httpClient = _getClient(
      baseUrl: baseUrl,
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
    String baseUrl = mainApiUrl,
    ContentType contentType = ContentType.json,
    ResponseType responseType = ResponseType.plain,
    bool shouldRetry = true,
  }) async {
    final httpClient = _getClient(
      baseUrl: baseUrl,
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
