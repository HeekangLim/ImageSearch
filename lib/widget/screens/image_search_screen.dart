import 'package:flutter/material.dart';
import 'package:jvn_project/define/dimens.dart';
import 'package:jvn_project/options/initializer.dart';
import 'package:jvn_project/widget/base_widget.dart';
import 'package:jvn_project/widget/items/text_widget.dart';
import 'package:jvn_project/widget/list_items/list_view_widget.dart';
import 'package:jvn_project/widget/viewmodels/view_model_search_image.dart';

class ImageSearchScreen extends StatefulWidget {
  const ImageSearchScreen({Key? key}) : super(key: key);

  @override
  _ImageSearchScreenState createState() => _ImageSearchScreenState();
}

class _ImageSearchScreenState extends State<ImageSearchScreen> {

  ViewModelSearchImage? _viewModel;
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _textFocus = FocusNode();

  String _textSearch = '';

  // static int _currentPage = 0;

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      debugPrint('hklim scroll');
      if (_scrollController.position.atEdge) {
        bool isTop = _scrollController.position.pixels == 0;
        if (isTop) {}
        else {
          _viewModel?.getNextPage();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ViewModelSearchImage>(
        viewmodel: ViewModelSearchImage(),
        builder: (context, viewModel, child) {
          _viewModel = viewModel;

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              titleSpacing: 0,
              // backgroundColor: Colors.green,   //영역 확인용
              toolbarHeight: Dimens.height_search_layout,
              // 상단 title 영역에 검색 영역을 넣어준다.
              title: _getSearchWidget(context),
              elevation: 0,
              // systemOverlayStyle: SystemUiOverlayStyle.dark,
            ),
            body: _getBodyWidget(context),
          );
        }
    );
  }

  // 검색 영역
  Widget _getSearchWidget(BuildContext context) {

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: Dimens.height_header_logo,
          alignment: Alignment.center,
          // color: Colors.red,
          child: TextWidget(
            // backgroundColor: Colors.blue,
            alignment: Alignment.center,
            text: '이미지 검색',
            textStyle: Theme.of(context).textTheme.titleLarge,
            size: 20.0,
          ),
        ),
        Container(
          width: double.infinity,
          height: Dimens.height_search_bar,
          margin: const EdgeInsets.only(top: 12,
              left: Dimens.spacing_list_default,
              right: Dimens.spacing_list_default,
              bottom: 2),
          decoration: const BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(
                Radius.circular(Dimens.radius_small)),
          ),
          child: Row(
            // row: Row(
            children: [
              // 돋보기 이미지
              GestureDetector(
                onTap: () {
                  ///  검색 (좌측 돋보기 모양) Tab 했을 떄의 동작.
                },
                child: Container(
                  height: Dimens.height_search_bar,
                  alignment: Alignment.centerLeft,

                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.spacing_search_default
                  ),
                  // 검색 (돋보기) 이미지
                  child: const Icon(
                    Icons.search,
                    color: Colors.black87,
                    size: Dimens.wh_icon_small,
                  ),
                ),
              ),

              // 텍스트 입력 창
              Flexible(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: double.infinity,
                    // color: Colors.lightGreen,
                    child: TextField(
                      cursorColor: Colors.black45,
                      autofocus: false,
                      focusNode: _textFocus,
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(
                          fontSize: Dimens.txt_size_default,
                          color: Colors.black45,
                        ),
                        hintMaxLines: 1,

                      ),
                      onChanged: (text) {
                        _textSearch = text;
                        // 값 변경시 리스트 변경, 기존 filter 에서 검색 입력에 해당 하는 리스트를 보여 준다.
                      },
                      onEditingComplete: (){
                        logger.d('TextField onEditingComplete');
                        _viewModel?.search(_textSearch);
                        _textFocus.unfocus();
                      },
                      onSubmitted: (result) {
                        logger.d('TextField onSubmitted');
                        _textFocus.unfocus();
                      },
                    ),
                  )
              ),

              // 텍스트 클리어 버튼
              GestureDetector(
                onTap: () {
                  clearSearch();
                },
                child: Container(
                  height: Dimens.height_search_bar,
                  width: Dimens.height_search_bar,
                  alignment: Alignment.centerRight,
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.spacing_search_default
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.black87,
                    size: Dimens.wh_icon_small,
                  ),
                ),
              ),
            ],
            // ),
          ),
        ),
        TextWidget(
          // backgroundColor: Colors.blue,
          alignment: Alignment.center,
          text: '리스트가 최하단에 도착할 때 다음 페이지 호출',
          size: 15.0,
          color: Colors.black,
        ),
      ],
    );
  }

  void clearSearch() {
    _textFocus.unfocus();
    _textEditingController.clear();
    _textSearch = '';
  }

  /// 리스트 영역
  Widget _getBodyWidget(BuildContext context) {
    // debugPrint('hklim ${_viewModel?.data?.meta?.pageable_count}');

    int itemCnt = 1;
    if (_viewModel?.data?.meta?.pageable_count != null) {
      itemCnt = (_viewModel!.data!.meta!.pageable_count! / ViewModelSearchImage.PAGE_CNT).ceil();
      // debugPrint('hklim itemCnt 1 : $itemCnt');
    }

    itemCnt = itemCnt > ViewModelSearchImage.MAX_PAGE_NUM ?
      ViewModelSearchImage.MAX_PAGE_NUM : itemCnt;

    // debugPrint('hklim itemCnt 2 : $itemCnt');

    return SafeArea(
      child:
        _viewModel?.listData?.isEmpty ?? true ?
        TextWidget(text: '검색창에 검색어를 입력 후\n검색을 수행해 주세요',
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          lines: 3,
        ) :
        Expanded(
          child: Scrollbar(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                ..._setSlivers(),
              ],
            ),
          ),
        ),
    );

  }

  List<Widget> _setSlivers() {
    var slivers = <Widget>[];

    int length = _viewModel?.listData.length ?? 0;

    // _viewModel?.data?.documents?.forEach((element) {
    for (int index=0; index<length; index++) {
      slivers.add(
        SliverList(delegate: SliverChildBuilderDelegate((context, i) {
          return SizedBox(//color: Colors.red,
              width: double.infinity,
              // child: _listViewWidget(index),
              child: ListViewWidget(data: _viewModel?.listData, index: index),
            );
          },
          childCount: 1
        ),),
      );
    }
    return slivers;
  }

  // @override
  // void dispose() {
  //   _pageController?.dispose();
  //   super.dispose();
  // }
}