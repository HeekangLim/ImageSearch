import 'package:jvn_project/domain/entities/request/req_search_image.dart';
import 'package:jvn_project/domain/entities/response/res_search_image.dart';
import 'package:jvn_project/domain/usecases/call/usecase_call_search_image.dart';
import 'package:jvn_project/options/injector.dart';
import 'package:jvn_project/widget/viewmodels/base_view_model.dart';

import '../../domain/entities/response/res_search_image_documents.dart';

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
  static var PAGE_CNT = 80;

  /**
   * 최대 페이지
   */
  static var MAX_PAGE_NUM = 50;

  /**
  * 기본 정렬
  */
  static var DEFAULT_SORT = 'accuracy';
  
  /**
   * 현재 페이지 number (최소 페이지 1)
   */
  static var _pageNum = 1;

  /**
   * 검색 단어
   */
  var _searchWord = '';

  /**
   * 저장 데이터 1페이지 부터 시작하는걸 기억해야한다.
   */
  static Map<int, ResSearchImage?> _data = {};

  static List<ResSearchImageDocuments> _listData = [];
  // Map<int, ResSearchImage?> get data => _data;

  ResSearchImage? get data => _data[_pageNum];

  List<ResSearchImageDocuments> get listData => _listData;
  // 검색 수행
  Future<void> search(String word) async{
    _data.clear();

    _pageNum = 1;
    await getCallSearchImage(query: word);

    _listData = _data?[_pageNum]?.documents ?? [];

    notifyListeners();
  }

  // 현재 검색어 페이지 변경
  Future<void> getNextPage() async {
    _pageNum ++;
    if (!_data.containsKey(_pageNum)) {
      await getCallSearchImage(page: _pageNum);
      _listData.addAll(_data?[_pageNum]?.documents ?? []);
    }
    notifyListeners();
  }

  Future<void> getCallSearchImage({String? query,
    int? page,
    Sort? sort
  }
      ) async {

    _searchWord = query ?? _searchWord;
    _pageNum = page ?? _pageNum;

    var thisSort = sort?.getText ?? DEFAULT_SORT;

    var req = ReqSearchImage(_searchWord, thisSort, _pageNum, PAGE_CNT);

    // var getData = await restApiCall(usecaseCallSearchImage, req);
    await netWorkCall(_usecaseCallSearchImage, req).then((response) {
      _data[_pageNum] = response?.data;
    });
  }
}