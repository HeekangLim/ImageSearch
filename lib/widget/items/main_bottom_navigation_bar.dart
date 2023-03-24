import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jvn_project/define/jvm_colors.dart';

class MainBottomNavigationBar extends StatefulWidget {
  final void Function(int) onTap;
  final int currentIndex;

  const MainBottomNavigationBar({
    Key? key,
    required this.onTap,
    this.currentIndex = 0,
  })  : super(key: key);

  @override
  _MainBottomNavigationBarState createState() =>
      _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<MainBottomNavigationBar>
    with SingleTickerProviderStateMixin {
  int? _currentIndex = 0;

  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onTapSelected(int index) async {
    // await HapticFeedback.lightImpact();

    widget.onTap(index);

    setState(() {
      _currentIndex = index;
    });
  }

  // 하단 탭 선언
  List<BottomNavigationBarItem> _buildNavigationBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Column(
          children: [
            // 탭 디자인 적용
            Text('이미지 검색'),
          ],
        ),
        activeIcon: Column(
          children: [
            // 탭 디자인 적용
            Text('이미지 검색'),
          ],
        ),
        label: '',
      ),

      BottomNavigationBarItem(
        icon: Column(
          children: [
            // 탭 디자인 적용
            Text('이미지 즐겨찾기'),
          ],
        ),
        activeIcon: Column(
          children: [
            // 탭 디자인 적용
            Text('이미지 즐겨찾기'),
          ],
        ),
        label: '',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // final info = await
    var screenSize = MediaQuery.of(context).size;

    // Log.D('screenSize.width : ${screenSize.width}');

    return SafeArea(child:
      SizedBox(
        height: screenSize.width > 500 ? 70.0 : 60.0,
        // mainAxisAlignment: MainAxisAlignment.end,
        child: Stack(
          children: [
            // shadow
            Container(
              height: 1,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: JColor.colorGrey100,
                      blurRadius: 6,
                      spreadRadius: 1
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(width: 1, color: JColor.colorGrey100)),
              ),
              child: Theme(
                data: ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),

                child: BottomNavigationBar(

                  elevation: 0.0,
                  type: BottomNavigationBarType.fixed,
                  onTap: _onTapSelected,
                  selectedItemColor: Colors.lightGreen,
                  selectedFontSize: 10,
                  selectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Colors.lightGreen,),
                  // selectedIconTheme: const IconThemeData(size: 34),
                  unselectedItemColor: JColor.colorGrey500,
                  unselectedFontSize: 10,
                  unselectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: JColor.colorGrey500,),
                  // unselectedIconTheme: const IconThemeData(size: 28),
                  currentIndex: _currentIndex!,
                  backgroundColor: Colors.white,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  items: _buildNavigationBarItems(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
