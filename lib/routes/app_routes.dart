
import 'package:flutter/material.dart';
import 'package:jvn_project/define/define.dart';
import 'package:jvn_project/widget/screens/intro_screen.dart';
import 'package:jvn_project/widget/screens/main_screen.dart';
import 'package:page_transition/page_transition.dart';

enum PAGES {
  splash,
  main,
}

class AppRoutes {

  static final GlobalKey<NavigatorState> gNaviState = GlobalKey<NavigatorState>();

  static final Map<PAGES, String> PAGE_PATH = {
    // PAGES.splash: Define.ROUTE,
    // PAGES.main : Define.ROUTE_MAIN,
    PAGES.main : Define.ROUTE,
  };

  // static CupertinoPageRoute<dynamic> onGenerateRoutes(RouteSettings settings) {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {

    if ( PAGE_PATH[PAGES.splash] == settings.name ) {
      // return _materialRoute(settings, IntroScreen());
      return PageTransition(child: const IntroScreen(), type: PageTransitionType.fade, settings: settings);
    }
    if ( PAGE_PATH[PAGES.main] == settings.name ) {
      // return _materialRoute(settings, MainScreen());
      return PageTransition(child: const MainScreen(), type: PageTransitionType.fade, settings: settings);
    }
    // default
    return PageTransition(child: const MainScreen(), type: PageTransitionType.leftToRight, settings: settings);
  }
}