import 'package:flutter/material.dart';
import 'package:jvn_project/widget/items/column_widget.dart';
import 'package:jvn_project/widget/items/main_bottom_navigation_bar.dart';
import 'package:jvn_project/widget/screens/image_favourites.dart';
import 'package:jvn_project/widget/screens/image_search_screen.dart';

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
      const ImageFavourites(),
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

  final _currentPageNotifier = ValueNotifier<int>(0);

  static const double _INDICATOR_HEIGHT = 30;
  static const double _BUTTON_HEIGHT = 48;

  Future<void> dialog() async {

    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context)
    {

      var screenSize = MediaQuery.of(context).size;

      var imageHeigth = screenSize.height * 0.5;
      var imageWidth = screenSize.width * 0.5;

      var indicatorHeight = _INDICATOR_HEIGHT;
      var popupHeight = imageHeigth + indicatorHeight + _BUTTON_HEIGHT;
      // var vFraction = 1 - screenSize.width / screenSize.height + 0.3;
      // vFraction = vFraction > 0.8 ? 0.8 : vFraction;

      _pageController?.dispose();
      _pageController = PageController(
        initialPage: 0,
        // viewportFraction: vFraction,
      );

      debugPrint('imageHeigth : $imageHeigth, imageWidth : $imageWidth');

      // return StatefulBuilder(
      //   builder: (BuildContext context, StateSetter setState) {
          // Flexible(child:
          return SafeArea(
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20),
            // color: Colors.red,
              child:
                ColumnWidget(
                  height: popupHeight,
                  width: imageWidth,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.white,
                  ),
                  mainAxisSize: MainAxisSize.max,

                  children: const [
                    // 팝업 메인
                  ],
                ),
          ),);
        },
      );
    // });
  }

  Color checkBoxColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.selected,
      MaterialState.focused,
      MaterialState.pressed,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.black;
  }
}