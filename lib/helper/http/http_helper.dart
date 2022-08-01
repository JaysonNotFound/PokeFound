import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/dependency/dio/dio_dependency.dart';
import '../../core/interceptor/json_http_request_interceptor.dart';
import '../../core/enum/http/content_type.dart';

@injectable
class HttpHelper {
  final DioDependency _dioDependency;
  final JsonHttpRequestInterceptor _jsonHttpRequestInterceptor;

  HttpHelper({
    required DioDependency dioDependency,
    required JsonHttpRequestInterceptor jsonHttpRequestInterceptor,
  })  : _dioDependency = dioDependency,
        _jsonHttpRequestInterceptor = jsonHttpRequestInterceptor;

  Dio getClient({
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
}
