import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'jvm_api_services.g.dart';

@RestApi(baseUrl: 'https://dapi.kakao.com')
abstract class JvmApiServices {
  factory JvmApiServices(Dio dio, {String baseUrl}) = _JvmApiServices;

  @GET('/v2/search/image')
  Future<HttpResponse<>> searchImage(@Header("Authorization") String token, @Queries() Map<String, dynamic> queries)
}