import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {

  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final double? width;
  final double? height;
  final Decoration? decoration;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final List<Widget> children;
  final BoxConstraints? constraints;

  const ColumnWidget({
    Key? key,
    this.alignment,
    this.padding,
    this.margin,
    this.color,
    this.width,
    this.height,
    this.decoration,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.constraints,
    required this.children,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        alignment: alignment,
        padding: padding,
        margin: margin,
        color: color,
        width: width,
        height: height,
        decoration: decoration,
        constraints: constraints,
        child: Column(
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
          textBaseline: textBaseline,
          children: children,
        ),
    );
  }

}