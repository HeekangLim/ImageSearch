import 'package:flutter/material.dart';
import 'package:jvn_project/define/dimens.dart';

enum Weight {
  thin, extralight, light, regular, medium, semibold, bold, extrabold, black,
}

extension WeightExtension on Weight {
  FontWeight get value {
    switch (this) {
      case Weight.thin :
        return FontWeight.w100;
      case Weight.extralight :
        return FontWeight.w200;
      case Weight.light :
        return FontWeight.w300;
      case Weight.regular :
        return FontWeight.w400;
      case Weight.medium :
        return FontWeight.w500;
      case Weight.semibold :
        return FontWeight.w600;
      case Weight.bold :
        return FontWeight.w700;
      case Weight.extrabold :
        return FontWeight.w800;
      case Weight.black :
        return FontWeight.w900;

      default :
        return FontWeight.w400;
    }
  }
}

class TextWidget extends StatelessWidget {

  GlobalKey _key = GlobalKey();

  final String text;
  Decoration? decoration;
  Weight? weight;
  double? width;
  double? height;
  double? minWidth;
  double? minHeight;
  double? maxWidth;
  double? maxHeight;
  double? size;
  int? lines;
  // Color? lineColor;
  Color? color;
  Color? backgroundColor;
  // double? lineWidth;
  // double? radius;
  TextOverflow? overflow;
  EdgeInsets? margin;
  EdgeInsets? padding;
  Alignment? alignment;
  TextStyle? textStyle;
  // bool? isMatchParent = false;
  // MainAxisAlignment? mainAxisAlignment;
  // CrossAxisAlignment? crossAxisAlignment;
  TextAlign? textAlign;
  double? letterHeight;
  final bool underline;
  final VoidCallback? onTap;

  TextWidget({Key? key,
    required this.text,
    this.decoration,
    this.weight,
    this.width,
    this.height,
    this.minWidth,
    this.minHeight,
    this.maxWidth,
    this.maxHeight,
    this.margin,
    this.padding,
    this.size,
    this.lines,
    this.color,
    // this.lineColor,
    // this.lineWidth,
    // this.radius,
    this.backgroundColor,
    this.overflow,
    // this.isMatchParent,
    this.alignment,
    // this.mainAxisAlignment,
    // this.crossAxisAlignment,
    this.underline = false,
    this.textAlign,
    this.textStyle,
    this.letterHeight,
    this.onTap,
  }) : super(key: key);


  TextStyle getTextStyle() {
    // double textSize = type?.value ?? size?? Dimens.txt_size_list_n;

    return TextStyle(
      color: color?? textStyle?.color ?? Colors.black87,
      fontWeight: weight?.value ?? textStyle?.fontWeight ?? Weight.regular.value,
      fontSize: size ?? textStyle?.fontSize ?? Dimens.txt_size_body_1,
      decoration : underline ? TextDecoration.underline : TextDecoration.none,
      height: letterHeight,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget container = getTextWidget();

    return container;
  }

  Widget getTextWidget() {

    return InkWell(

      onTap: onTap,

      child: Container(
          key: _key,
          width: width,
          height: height,
          alignment: alignment,
          margin: margin,
          padding: padding,
          decoration: decoration,
          color: backgroundColor,
          constraints: BoxConstraints(
            minWidth: minWidth?? 0.0,
            minHeight: minHeight?? 0.0,
            maxWidth: maxWidth?? double.infinity,
            maxHeight: maxHeight?? double.infinity,
          ),

          child: getText()
      ),
    );
  }

  Text getText() {

    return Text(
      text,
      textAlign: textAlign,
      style: getTextStyle(),
      maxLines: lines?? 1,
      overflow: overflow?? TextOverflow.ellipsis,
    );
  }
}