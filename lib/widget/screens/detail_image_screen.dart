import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jvn_project/define/define.dart';
import 'package:jvn_project/options/initializer.dart';
import 'package:jvn_project/widget/items/column_widget.dart';
import 'package:jvn_project/widget/items/common_widget.dart';
import 'package:jvn_project/widget/items/rounded_image_widget.dart';

import '../../domain/entities/response/res_search_image_documents.dart';

class DetailImageScreen extends StatelessWidget {

  /**
   * 이미지 페이지 컨트롤러
   */
  PageController? _pageController;
  int _currentPage = 0;
  List<ResSearchImageDocuments>? _listImage;

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;

    if(settings.arguments != null) {
      // print('imgUrl arguments not null');
      Map<String, dynamic>? arguments = settings.arguments! as Map<String, dynamic>;
      _listImage = arguments[Define.arguments.detail_img] as List<ResSearchImageDocuments>;
      _currentPage = arguments[Define.arguments.detail_img_index] as int;
    }

    var screenSize = MediaQuery.of(context).size;

    var vFraction = 0.9;

    var borderHeight = screenSize.height * vFraction;
    var borderWidth = screenSize.width * vFraction;

    _pageController?.dispose();
    _pageController = PageController(
      initialPage: _currentPage,
      viewportFraction: vFraction,
    );

    return Scaffold(
      // backgroundColor: PColors.color_grey_hard,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CommonWidget.getHeaderWidget(
          context,
          title: '이미지 상세'
        ),
        elevation: 0.0,
      ),
      body:SafeArea( child:

      ColumnWidget(
        width: double.infinity,
        height: double.infinity,
        // color: Colors.green,
        margin: const EdgeInsets.only(bottom: 15),
        children: [
          Expanded(child:
          Container(
            // width: containerWidth,
            child:
            PageView.builder(
              onPageChanged: (index) => {
                _currentPage = index
              },
              itemBuilder: (BuildContext context, int index) {
                String url =_listImage?[index].image_url?? '';

                var imageHeigth = borderHeight;
                var imageWidth = borderWidth;

                var realHeight = _listImage?[_currentPage].height ?? imageHeigth;
                var realWidth = _listImage?[_currentPage].width ?? imageWidth;

                imageHeigth = imageWidth * realHeight / realWidth;
                // var tempHeight = imageWidth * realHeight / realWidth;

                // 어떤 아이템?
                return Container(
                  // color: Colors.red,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    // color: Colors.red,
                    child: RoundedImageWidget (
                      borderWidth: borderWidth,
                      borderHeight: borderHeight,
                      height: imageHeigth,
                      width: imageWidth,
                      url: url,
                      imageRadius: BorderRadius.zero,
                      isIcon: false,
                    )
                );
              },
              controller: _pageController,
              itemCount: _listImage?.length?? 0,
              // padEnds: false,
            ),
          ),
          ),
        ],
      ),
      ),
    );
  }

}