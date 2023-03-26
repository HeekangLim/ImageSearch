import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIconCheckbox extends StatefulWidget {
  const CustomIconCheckbox({
    Key? key,
    this.iconSize = 24,
    this.onChanged,
    this.checkedColor = Colors.red,
    this.uncheckedColor = Colors.black,
    this.checkedIcon,
    this.uncheckedIcon,
    this.isChecked = false,
  }) : super(key: key);

  // Now you can set the checkmark size of your own
  final double iconSize;
  final Color checkedColor;
  final Color uncheckedColor;
  final Icon? checkedIcon;
  final Icon? uncheckedIcon;
  final bool isChecked;
  final Function(bool)? onChanged;

  @override
  State<CustomIconCheckbox> createState() => _CustomIconCheckboxState();
}

class _CustomIconCheckboxState extends State<CustomIconCheckbox> {
  late bool isChecked = widget.isChecked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => isChecked = !isChecked);
        widget.onChanged?.call(isChecked);
      },
      child: isChecked
            ? widget.checkedIcon ?? Icon(
          Icons.favorite,
          size: widget.iconSize,
          color: widget.checkedColor,
        )
            : widget.uncheckedIcon ?? Icon(Icons.favorite_border,
        size: widget.iconSize,
        color: widget.uncheckedColor,
      ),
    );
  }
}