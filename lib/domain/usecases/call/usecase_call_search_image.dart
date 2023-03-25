import 'package:jvn_project/domain/entities/response/res_search_image.dart';
import 'package:jvn_project/domain/usecases/base_usecase.dart';
import 'package:jvn_project/domain/values/result.dart';

import '../../entities/request/req_search_image.dart';
import '../../repositories/jvm_repositories.dart';

class UsecaseCallSearchImage extends BaseUseCase <ReqSearchImage?, Result<ResSearchImage>>{
  final JvmRepositories _jvmRepositories;
  UsecaseCallSearchImage(this._jvmRepositories);

  /**
   * 공통 호출 영역
   */
  @override
  Future<Result<ResSearchImage>> call(ReqSearchImage? query) {
    return _jvmRepositories.getSearchImage(query ?? ReqSearchImage('', 'accuracy', 1, 30));  // 검색어가 null 이면 그냥 검색.
  }

}