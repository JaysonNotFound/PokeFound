import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class DioDependency {
  Dio getBaseHttpClient({
    required String baseUrl,
  }) {
    return Dio(BaseOptions(baseUrl: baseUrl));
  }
}
