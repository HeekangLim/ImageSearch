import 'package:flutter/material.dart';
import 'package:jvn_project/utils/preference_helper.dart';
import 'package:jvn_project/widget/items/common_widget.dart';
import 'package:jvn_project/widget/items/text_widget.dart';
import 'package:jvn_project/widget/list_items/list_view_widget.dart';

import '../../domain/entities/response/res_search_image_documents.dart';

class ImageFavouritesScreen extends StatefulWidget {
  const ImageFavouritesScreen({Key? key}) : super(key: key);
  @override
  _ImageFavouritesScreenState createState() => _ImageFavouritesScreenState();
}

class _ImageFavouritesScreenState extends State<ImageFavouritesScreen> {

  Map<String, ResSearchImageDocuments>? _mapFavorites;

  @override
  Widget build(BuildContext context) {
    _mapFavorites = PreferenceHelper.getImages();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CommonWidget.getHeaderWidget(
            context,
            title: '즐겨 찾기',
            showBackButton: false,
        ),
      ),
      body: _getBodyWidget(context),
    );
  }

  /// 리스트 영역
  Widget _getBodyWidget(BuildContext context) {
    return SafeArea(
      child:
        _mapFavorites?.isEmpty ?? true ?
        TextWidget(text: '즐겨찾기 목록이 비었습니다.',
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          lines: 3,
        ) :Scrollbar(
        child: CustomScrollView(
          slivers: [
            ..._setSlivers(),
          ],
        ),),);
  }

  List<Widget> _setSlivers() {
    var slivers = <Widget>[];

    int length = _mapFavorites?.length ?? 0;

    // _viewModel?.data?.documents?.forEach((element) {
    for (int index=0; index<length; index++) {
      slivers.add(
        SliverList(delegate: SliverChildBuilderDelegate((context, i) {
          return SizedBox(//color: Colors.red,
            width: double.infinity,
            // child: _listViewWidget(index),
            child: ListViewWidget(
              data: _mapFavorites?.values.toList(),
              index: index,
              onChanged: (isChecked) async {
                debugPrint('hklim $isChecked');
                if(!isChecked) {
                  // await Future.delayed(const Duration(milliseconds: 500));
                  setState(() {
                  });
                }
              },
            ),
          );
        },
            childCount: 1
        ),),
      );
    }
    return slivers;
  }
}