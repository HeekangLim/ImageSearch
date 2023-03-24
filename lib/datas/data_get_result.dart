
import 'package:dio/dio.dart';
import 'package:jvn_project/domain/values/result.dart';
import 'package:jvn_project/options/initializer.dart';
import 'package:retrofit/dio.dart';

mixin DataGetResult {
  // Mutable 한 Result를 돌려주는 getResult usecase 에서 call 을 수행.
  Future<Result<T>> getResult<T>(Future<HttpResponse<T>> call) async {
    try {
      final HttpResponse<T> httpResponse = await call;
      final int statusCode = httpResponse.response.statusCode ?? 0;
      final String statusMessage = httpResponse.response.statusMessage ?? '';
      // 성공 코드
      if (statusCode == 200) {
        logger.d('response data : ${httpResponse.response.data}');
        return Success<T>(httpResponse.data);
      }
      logger.d('statusCode : $statusCode / $statusMessage');
      return Error<T>(statusCode, statusMessage);
    } on DioError catch (e) { // dio Error 발생 확인.
      final response = e.response;
      logger.e('DioError : ${e.message}');
      logger.e('DioError : ${e.requestOptions.data}');
      logger.e('DioError : ${e.error}');
      return Failed<T>(response?.statusCode ?? -1, e?.message ?? '', e);
    }
  }
}