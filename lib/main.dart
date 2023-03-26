import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jvn_project/options/initializer.dart';
import 'package:jvn_project/options/injector.dart';
import 'package:jvn_project/routes/app_routes.dart';
import 'package:jvn_project/themes/app_theme.dart';
import 'package:jvn_project/utils/preference_manager.dart';

Future<void> main() async {
  // 위젯 바인딩 보장 위한 선언
  WidgetsFlutterBinding.ensureInitialized();

  initializeLogger();

  // GET IT 이용하여 사용할 모델들을 인젝트
  await initializeInjector();

  // preference manager 초기화
  await PreferenceManager.initialize();

  // 세로 고정
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 화면 고정을 위해서 설정
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!,
        );
      },
      title: 'JVN Project',
      theme: AppTheme.jvm_theme,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      navigatorObservers: const [ /* 필요시 observer 설정*/ ],

      // context 사용을 위해 글로벌 키로 설정
      navigatorKey: AppRoutes.gNaviState,
    );
  }

  static const List<Locale> locales = <Locale>[
    Locale('ko'),
    Locale('en'),
  ];
}
