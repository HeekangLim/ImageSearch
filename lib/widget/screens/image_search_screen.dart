import 'package:flutter/material.dart';

class ImageSearchScreen extends StatefulWidget {
  ImageSearchScreen({Key? key}) : super(key: key);
  @override
  _ImageSearchScreenState createState() => _ImageSearchScreenState();
}

class _ImageSearchScreenState extends State<ImageSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      alignment: Alignment.center,
      child: const Text('이미지 검색'),
    );
  }

}