import 'package:dio/dio.dart';
import 'package:jvn_project/domain/entities/request/req_search_image.dart';
import 'package:retrofit/retrofit.dart';

import '../entities/response/res_search_image.dart';

part 'jvm_api_services.g.dart';

@RestApi(baseUrl: 'https://dapi.kakao.com')
abstract class JvmApiServices {
  factory JvmApiServices(Dio dio, {String baseUrl}) = _JvmApiServices;

  @GET('/v2/search/image')
  Future<HttpResponse<ResSearchImage>> searchImage(/*@Header("Authorization") String token, */
    @Queries() Map<String, dynamic> queries);
  // @GET('/v2/search/image')
  // Future<HttpResponse<ResSearchImage>> searchImage(@Body() ReqSearchImage query);//@Queries() Map<String, dynamic> queries);
}