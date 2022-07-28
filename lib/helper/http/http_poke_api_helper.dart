import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'content_type.dart';
import 'http_helper.dart';

@injectable
class HttpPokeApiHelper {
  final HttpHelper _httpHelper;

  HttpPokeApiHelper({
    required HttpHelper httpHelper,
  }) : _httpHelper = httpHelper;

  static const String pokeApiUrl = 'https://pokeapi.co/api/v2/';

  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    ContentType contentType = ContentType.json,
    ResponseType responseType = ResponseType.plain,
    bool shouldRetry = true,
  }) async {
    final httpClient = _httpHelper.getClient(
      baseUrl: pokeApiUrl,
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
      baseUrl: pokeApiUrl,
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
      baseUrl: pokeApiUrl,
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
      baseUrl: pokeApiUrl,
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
