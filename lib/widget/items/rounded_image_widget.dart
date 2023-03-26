import 'package:flutter/material.dart';
import 'package:jvn_project/define/define.dart';
import 'package:jvn_project/widget/items/asset_image_widget.dart';
import 'package:jvn_project/widget/items/image_widget.dart';

class RoundedImageWidget extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final BorderRadius? imageRadius;
  final BoxFit? fit;
  final bool isIcon;
  final double? borderWidth;
  final double? borderHeight;
  // final Decoration? decoration;

  const RoundedImageWidget({
    Key? key,
    required this.url,
    this.width,
    this.height,
    this.borderWidth,
    this.borderHeight,
    this.borderRadius,
    this.imageRadius,
    this.padding,
    this.margin,
    this.fit,
    this.isIcon = true,
    // this.decoration,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    String aseetPath = Define.ASSET_IMAGE_DEFAULT_ICON;

    Widget defaultImageWidget =
    Container(
      // color: Colors.red,
      margin: margin,
      padding: padding,
      width: borderWidth,
      height: borderHeight,
      alignment: Alignment.center,
      child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.zero,
          child:AssetImageWidget(
            image: aseetPath,
            width: width,
            height: height,
          )
      ),
    );

    Widget imageWidget = url != null ?
    Container(
      alignment: Alignment.center,
      child: ImageWidget(
        url: url!,
        width: width,
        height: height,
        margin: margin,
        fit: fit,
        errorView: defaultImageWidget,
        padding: padding,
        borderRadius: imageRadius ?? borderRadius ?? const BorderRadius.all(Radius.circular(12)),
      ),
    ):
    Container(color: Colors.transparent,);

    Widget borderWidget =
      Container(
        width: borderWidth ?? width,
        height: borderHeight ?? height,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(12)),
          border: Border.all(
            color: Colors.black12,
            width: 1,
          ),
        ),
      );


      return Stack(
        children: [
          defaultImageWidget,
          imageWidget,
          borderWidget,
        ],
    );
  }
}

