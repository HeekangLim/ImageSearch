import 'package:jvn_project/domain/entities/request/req_search_image.dart';
import 'package:jvn_project/domain/entities/response/res_search_image.dart';
import 'package:jvn_project/domain/usecases/call/usecase_call_search_image.dart';
import 'package:jvn_project/options/injector.dart';
import 'package:jvn_project/widget/viewmodels/base_view_model.dart';

enum Sort {
  accuracy,
  recency
}

extension SortExtention on Sort {
  String get getText {
    switch (this) {
      case Sort.accuracy :
        return 'accuracy';
      case Sort.recency :
        return 'recency';
      default:
        return 'accuracy';
    }
  }
}
class ViewModelSearchImage extends BaseViewModel {
  final UsecaseCallSearchImage _usecaseCallSearchImage = injector();

  /**
   * 한 페이지 카운트
   */
  static var _PAGE_CNT = 80;

  /**
   * 최대 페이지
   */
  static var _MAX_PAGE_NUM = 50;

  /**
  * 기본 정렬
  */
  static var _DEFAULT_SORT = 'accuracy';
  
  /**
   * 현재 페이지 number
   */
  static var _pageNum = 1;

  /**
   * 검색 단어
   */
  var _searchWord = '';

  /**
   * 저장 데이터
   */
  static Map<int, ResSearchImage?> _data = {};

  // Map<int, ResSearchImage?> get data => _data;

  ResSearchImage? get data => _data[_pageNum];

  Future<void> search(String word) async{
    _data.clear();
    await getCallSearchImage(query: word);
  }

  Future<void> getPage(int page) async {
    if (!_data.containsKey(page)) {
      await getCallSearchImage(page: page);
    }
  }

  Future<void> getCallSearchImage({String? query,
    int? page,
    Sort? sort
  }
      ) async {

    _searchWord = query ?? _searchWord;
    _pageNum = page ?? _pageNum;

    var thisSort = sort?.getText ?? _DEFAULT_SORT;

    var req = ReqSearchImage(_searchWord, thisSort, _pageNum, _MAX_PAGE_NUM);

    // var getData = await restApiCall(usecaseCallSearchImage, req);
    netWorkCall(_usecaseCallSearchImage, req).then((response) {
      _data[_pageNum] = response?.data;
      notifyListeners();
    });
  }
}