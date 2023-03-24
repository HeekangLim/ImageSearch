import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {

  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final double? width;
  final double? height;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final List<Widget> children;
  final VoidCallback? onTap;
  final Decoration? decoration;

  const RowWidget({
    Key? key,
    this.alignment,
    this.padding,
    this.margin,
    this.color,
    this.width,
    this.height,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    required this.children,
    this.onTap,
    this.decoration,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: padding,
      margin: margin,
      color: color,
      width: width,
      height: height,
      decoration: decoration,
      child: Row(
        children: children,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
      ),
    );
  }

}