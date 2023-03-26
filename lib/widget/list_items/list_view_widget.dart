
import 'package:flutter/material.dart';
import 'package:jvn_project/define/define.dart';
import 'package:jvn_project/define/dimens.dart';
import 'package:jvn_project/routes/app_routes.dart';
import 'package:jvn_project/widget/items/asset_image_widget.dart';
import 'package:jvn_project/widget/items/column_widget.dart';
import 'package:jvn_project/widget/items/custom_checkbox.dart';
import 'package:jvn_project/widget/items/rounded_image_widget.dart';
import 'package:jvn_project/widget/items/text_widget.dart';

import '../../domain/entities/response/res_search_image_documents.dart';
import '../../utils/preference_helper.dart';

class ListViewWidget extends StatelessWidget {

  List<ResSearchImageDocuments>? data;
  int index;
  bool isFavourites;
  
  ListViewWidget({
    Key? key,
    required this.data,
    this.index = 0,
    this.isFavourites = true,
  }):super(key: key);


  final _favouriteData = PreferenceHelper.getImages();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {

    // debugPrint('hklim listViewWidget');

    _isChecked = _favouriteData.containsKey(data?[index].image_url);
    
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
        // 해당 아이템 선택 시 상세화면 이동
        Navigator.pushNamed(context,
            PAGES.detailImage.getPath,
            arguments: {
              Define.arguments.detail_img: data,
              Define.arguments.detail_img_index: index,
            });
      },
      child: ColumnWidget(
        color: Colors.transparent,
        alignment: Alignment.centerLeft,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        height: Dimens.height_list_huge,
        margin: const EdgeInsets.symmetric(horizontal: Dimens.spacing_list_default),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // 아이콘 이미지
              Stack(
                children: [
                  const AssetImageWidget(width: Dimens.wh_icon_big,
                      height: Dimens.wh_icon_big,
                      image: Define.ASSET_IMAGE_DEFAULT_ICON),

                  RoundedImageWidget(
                    url: data?[index].thumbnail_url,
                    width: Dimens.wh_icon_big,
                    height: Dimens.wh_icon_big,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                ],),

              /// 텍스트 부
              Expanded(
                child: ColumnWidget(
                  margin: const EdgeInsets.only(left: Dimens.spacing_default),
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      alignment: Alignment.centerLeft,
                      text: data?[index].display_sitename ?? '',
                      size: Dimens.txt_size_body_1,
                      height: Dimens.height_list_title,
                      overflow: TextOverflow.ellipsis,
                      weight: Weight.medium,
                    ),
                    TextWidget(
                      alignment: Alignment.centerLeft,
                      text: data?[index].datetime ?? '',
                      size: Dimens.txt_size_subtitle_2,
                      height: Dimens.height_list_title,
                      overflow: TextOverflow.ellipsis,
                      weight: Weight.light,
                    ),
                  ],
                ),),
                isFavourites ?
                CustomIconCheckbox(
                  isChecked: _isChecked,
                  onChanged: (isChecked) {
                    // check box 선택 시 동작
                    if (isChecked) {
                      PreferenceHelper.saveImage(data?[index]);
                    }
                    else {
                      PreferenceHelper.removeImage(data?[index]);
                    }
                  },
                ) : Container(),
            ],
          ),
        ],),
    );
  }
}