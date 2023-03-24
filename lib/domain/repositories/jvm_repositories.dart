import 'package:jvn_project/domain/entities/response/res_search_image.dart';
import 'package:jvn_project/domain/values/result.dart';

abstract class JvmRepositories {
  Future<Result<ResSearchImage>> getSearchImage(String query);
}