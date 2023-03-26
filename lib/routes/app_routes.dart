
import 'package:flutter/material.dart';
import 'package:jvn_project/define/define.dart';
import 'package:jvn_project/widget/screens/detail_image_screen.dart';
import 'package:jvn_project/widget/screens/intro_screen.dart';
import 'package:jvn_project/widget/screens/main_screen.dart';
import 'package:page_transition/page_transition.dart';

enum PAGES {
  splash,
  main,
  detailImage,
}

extension PagesExtension on PAGES {

  String get getPath {
    switch(this) {
      case PAGES.splash :
        return '/splash';
      case PAGES.main :
        return '/';
      case PAGES.detailImage :
        return '/detail_image';

    }
  }
}

class AppRoutes {

  static final GlobalKey<NavigatorState> gNaviState = GlobalKey<NavigatorState>();

  // static CupertinoPageRoute<dynamic> onGenerateRoutes(RouteSettings settings) {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {

    if ( PAGES.splash.getPath == settings.name ) {
      // return _materialRoute(settings, IntroScreen());
      return PageTransition(child: const IntroScreen(), type: PageTransitionType.fade, settings: settings);
    }
    if ( PAGES.main.getPath == settings.name ) {
      // return _materialRoute(settings, MainScreen());
      return PageTransition(child: const MainScreen(), type: PageTransitionType.fade, settings: settings);
    }
    else if ( PAGES.detailImage.getPath == settings.name ) {
      // return _materialRoute(settings, DetailImageScreen());
      return PageTransition(child: DetailImageScreen(), type: PageTransitionType.rightToLeft, settings: settings,);
    }

    // default
    return PageTransition(child: const MainScreen(), type: PageTransitionType.leftToRight, settings: settings);
  }
}