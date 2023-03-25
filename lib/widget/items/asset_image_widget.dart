import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jvn_project/define/dimens.dart';

class AssetImageWidget extends StatelessWidget {
  final String image;
  final String? semanticsLabel;
  final double? width;
  final double? height;
  final Color? color;
  final GestureTapCallback? onTap;

  const AssetImageWidget({
    Key? key,
    required this.image,
    this.semanticsLabel = 'Pulmuone',
    this.width,
    this.height,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (image.isEmpty) {
      return Container();
    }

    if (image.endsWith('.svg')) {
      return GestureDetector(
        onTap: onTap,
        child: SvgPicture.asset(
          image,
          semanticsLabel: semanticsLabel,
          width: width ?? Dimens.wh_icon_mid,
          height: height ?? Dimens.wh_icon_mid,
          color: color,
        ),
      );
    } else {
      return GestureDetector(
        onTap: onTap,
        child: Image.asset(
          image,
          width: width ?? Dimens.wh_icon_mid,
          height: height ?? Dimens.wh_icon_mid,
          color: color,
        ),
      );
    }
  }
}