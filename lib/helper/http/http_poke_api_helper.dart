import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/enum/http/content_type.dart';
import 'http_client_helper.dart';

@injectable
class HttpPokeApiHelper {
  final HttpClientHelper _httpHelper;

  HttpPokeApiHelper({
    required HttpClientHelper httpHelper,
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
}
