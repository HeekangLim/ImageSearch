import 'package:jvn_project/datas/data_get_result.dart';
import 'package:jvn_project/domain/entities/response/res_search_image.dart';
import 'package:jvn_project/domain/repositories/jvm_repositories.dart';
import 'package:jvn_project/domain/values/result.dart';

class RepositoriesImplements extends JvmRepositories with DataGetResult {
  @override
  Future<Result<ResSearchImage>> getSearchImage(String query) {
    // TODO: implement getSearchImage
    throw UnimplementedError();
  }
  
}