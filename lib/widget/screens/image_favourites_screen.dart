import 'package:flutter/material.dart';
import 'package:jvn_project/define/dimens.dart';
import 'package:jvn_project/utils/preference_helper.dart';
import 'package:jvn_project/widget/items/common_widget.dart';
import 'package:jvn_project/widget/list_items/list_view_widget.dart';

class ImageFavouritesScreen extends StatefulWidget {
  const ImageFavouritesScreen({Key? key}) : super(key: key);
  @override
  _ImageFavouritesScreenState createState() => _ImageFavouritesScreenState();
}

class _ImageFavouritesScreenState extends State<ImageFavouritesScreen> {

  var _mapFavorites = PreferenceHelper.getImages();

  @override
  Widget build(BuildContext context) {
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
      child: Scrollbar(
        child: CustomScrollView(
          slivers: [
            ..._setSlivers(),
          ],
        ),),);
  }

  List<Widget> _setSlivers() {
    var slivers = <Widget>[];

    int length = _mapFavorites.length;

    // _viewModel?.data?.documents?.forEach((element) {
    for (int index=0; index<length; index++) {
      slivers.add(
        SliverList(delegate: SliverChildBuilderDelegate((context, i) {
          return SizedBox(//color: Colors.red,
            width: double.infinity,
            // child: _listViewWidget(index),
            child: ListViewWidget(
              data: _mapFavorites.values.toList(),
              index: index,
              isFavourites: false,
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