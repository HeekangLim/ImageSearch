import 'package:jvn_project/datas/data_get_result.dart';
import 'package:jvn_project/domain/api/jvm_api_services.dart';
import 'package:jvn_project/domain/entities/response/res_search_image.dart';
import 'package:jvn_project/domain/repositories/jvm_repositories.dart';
import 'package:jvn_project/domain/values/result.dart';

import '../../domain/entities/request/req_search_image.dart';

enum ReqSearchImageKey {
  query, sort, page, size
}
extension ReqSearchImageKeyExtension on ReqSearchImageKey {
  String get getText {
    switch (this) {
      case ReqSearchImageKey.query :
        return 'query';
      case ReqSearchImageKey.sort :
        return 'sort';
      case ReqSearchImageKey.page :
        return 'page';
      case ReqSearchImageKey.size :
        return 'size';
      default:
        return 'query';
    }
  }
}

// 실제 수행하는 동작 선언.
class RepositoriesImplements extends JvmRepositories with DataGetResult {

  final JvmApiServices _apiServices;

  RepositoriesImplements(this._apiServices);

  @override
  Future<Result<ResSearchImage>> getSearchImage(ReqSearchImage query) {
    // request 요청 방식 map 형태로 요청
    Map<String, dynamic> queryMap = {
      ReqSearchImageKey.query.getText: query.query,
      ReqSearchImageKey.sort.getText: query.sort,
      ReqSearchImageKey.page.getText: query.page,
      ReqSearchImageKey.size.getText: query.size,
    };

    return getResult<ResSearchImage>(_apiServices.searchImage(queryMap));
  }
  
}