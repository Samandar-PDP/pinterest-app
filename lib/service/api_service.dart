import 'package:dio/dio.dart' hide Headers;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import '../model/image_response.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @Headers({
    "Authorization": "Client-ID lOwYkRhXb7OgyGquor9WgJsk1uBNU4zhYjtlWfvMFqo"
  })
  @GET('/photos/random?count=100')
  Future<List<ImageResponse>> getImages();
}

Dio buildDioClient(String base) {
  final dio = Dio()..options = BaseOptions(baseUrl: base);
  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90));
  return dio;
}
