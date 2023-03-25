import 'package:flutter/material.dart';
import 'package:jvn_project/define/define.dart';
import 'package:jvn_project/define/dimens.dart';
import 'package:jvn_project/domain/entities/response/res_search_image_documents.dart';
import 'package:jvn_project/options/initializer.dart';
import 'package:jvn_project/widget/base_widget.dart';
import 'package:jvn_project/widget/items/asset_image_widget.dart';
import 'package:jvn_project/widget/items/column_widget.dart';
import 'package:jvn_project/widget/items/rounded_image_widget.dart';
import 'package:jvn_project/widget/viewmodels/apps/view_model_search_image.dart';

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
          child: const AssetImageWidget(
            image: Define.ASSET_IMAGE_DEFAULT_ICON,
            width: Dimens.wh_icon_huge,
            height: Dimens.wh_icon_huge,)
        ),
        Container(
          width: double.infinity,
          height: Dimens.height_search_bar,
          margin: const EdgeInsets.only(top: 12,
              left: Dimens.spacing_list_default,
              right: Dimens.spacing_list_default,
              bottom: 12),
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
                  // _viewModel?.search(_textSearch);
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
        )
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
    return SafeArea(
      child: Scrollbar(
        child: CustomScrollView(
          slivers: [
            ..._setSlivers(),
          ],
        ),),);
  }

  List<Widget> _setSlivers() {
    var slivers = <Widget>[];
    _viewModel?.data?.documents?.forEach((element) {
      slivers.add(
        SliverList(delegate: SliverChildBuilderDelegate((context, index) {
          return SizedBox(//color: Colors.red,
              width: double.infinity,
              child: _getListViewWidget(element),
            );
          },
          childCount: 1
        ),),
      );
    });

    return slivers;
  }

  Widget _getListViewWidget(ResSearchImageDocuments item) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
        // 해당 아이템 선택 시 동작
        // Navigator.pushNamed(context,
        //     AppRoutes.PAGE_PATH[PAGES.detail]?? Define.ROUTE_DETAIL,
        //     arguments: {
        //       Define.arguments.detail: model,
        //     });
      },
      child: ColumnWidget(
        color: Colors.transparent,
        alignment: Alignment.centerLeft,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        height: Dimens.height_list_huge,
        margin: const EdgeInsets.symmetric(horizontal: Dimens.spacing_list_default),
        children: [
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            // 아이콘 이미지
              Stack(
                children: [
                  const AssetImageWidget(width: Dimens.wh_icon_big,
                      height: Dimens.wh_icon_big,
                      image: Define.ASSET_IMAGE_DEFAULT_ICON),
                  /// image icon 표시 (ios / and 구분 없음)
                  RoundedImageWidget(
                    url: item.thumbnail_url,
                    width: Dimens.wh_icon_big,
                    height: Dimens.wh_icon_big,
                    // decoration: BoxDecoration(
                    //     borderRadius: const BorderRadius.all(Radius.circular(Dimens.radius_circular))
                    // ),
                  ),
              ],),
            ],
          ),
      ],),
    );
  }
}