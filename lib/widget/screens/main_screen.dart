import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jvn_project/widget/items/column_widget.dart';
import 'package:jvn_project/widget/items/main_bottom_navigation_bar.dart';
import 'package:jvn_project/widget/screens/image_favourites_screen.dart';
import 'package:jvn_project/widget/screens/image_search_screen.dart';

import '../items/text_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  late List<Widget> _listWidets;
  int _currentIndex = 0;  // 최초 카테고리 탭

  @override
  void initState() {
    super.initState();

    // init 수행
    _listWidets = [
      const ImageSearchScreen(),
      const ImageFavouritesScreen(),
    ];
  }

  void _onTap(int index) {
    // 진동 등 피드백
    // HapticFeedback.lightImpact();

    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        FocusScope.of(context).unfocus();

        showDialog(context: context,
            builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('종료 다이얼로그'),
            content: TextWidget(
              text: '앱을 종료 하시겠 습니까?',
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('취소'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: const Text('확인'),
                onPressed: () {
                  SystemNavigator.pop();
                },
              ),
            ],
          );
        });
        // 앱 exit 여부 팝업 노출.
        return false;
      },
          // return
      child: Scaffold(
            body: SafeArea(
                child: Container(
                  alignment: Alignment.center,
                  child: _listWidets[_currentIndex],
                )),
            bottomNavigationBar: MainBottomNavigationBar(
              onTap: _onTap,
              currentIndex: _currentIndex,

            ),
          ),
      //   }
      // ),

    );
  }
  PageController? _pageController;

}