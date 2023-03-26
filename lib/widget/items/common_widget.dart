import 'package:flutter/material.dart';
import 'package:jvn_project/define/dimens.dart';
import 'package:jvn_project/widget/items/asset_image_widget.dart';
import 'package:jvn_project/widget/items/row_widget.dart';
import 'package:jvn_project/widget/items/text_widget.dart';

class CommonWidget {
  /**
   * 헤더, 위젯
   */
  static Widget getHeaderWidget(BuildContext context,
      {
        String? title,
        GestureTapCallback? onTapBack,
        AssetImageWidget? imageRight,
        VoidCallback? imageRightTab,
        double height = Dimens.tabBarHeight, double? width,
        bool showBackButton = true,
      }
      ) {
    return
      RowWidget(
          alignment: Alignment.center,
          height: height,
          width: width,
          // color: Colors.blue,
          children: [
            // SvgPicture.asset(
            showBackButton ?
            GestureDetector(
              onTap: onTapBack ?? () => Navigator.pop(context),
              child: Container(
                // color: Colors.red,
                color: Colors.transparent,
                alignment: Alignment.centerLeft,
                width: 100,
                height: Dimens.tabBarHeight,
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ): Container(width: 100,
            ),

            const Spacer(),
            TextWidget(
              // backgroundColor: Colors.blue,
              height: height,
              alignment: Alignment.center,
              text: title?? '',
              textStyle: Theme.of(context).textTheme.titleLarge,
              size: 20.0,
            ),
            const Spacer(),

            imageRightTab != null ? GestureDetector(
              onTap: imageRightTab,
              child: Container(
                // color: Colors.green,
                  color: Colors.transparent,
                  alignment: Alignment.centerRight,
                  width: 100,
                  height: Dimens.tabBarHeight,
                  child: imageRight ?? Container()
              ),
            ) : Container(width: 100,),

          ],
      );
  }
}