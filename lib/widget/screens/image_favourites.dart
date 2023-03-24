import 'package:flutter/material.dart';

class ImageFavourites extends StatefulWidget {
  const ImageFavourites({Key? key}) : super(key: key);
  @override
  _ImageFavouritesState createState() => _ImageFavouritesState();
}

class _ImageFavouritesState extends State<ImageFavourites> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: const Text('이미지 즐겨찾기'),
    );
  }

}