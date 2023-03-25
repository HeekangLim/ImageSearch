import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:jvn_project/datas/repositories/repositories_implements.dart';
import 'package:jvn_project/domain/api/jvm_api_services.dart';
import 'package:jvn_project/domain/repositories/jvm_repositories.dart';
import 'package:jvn_project/domain/usecases/call/usecase_call_search_image.dart';
import 'package:jvn_project/options/initializer.dart';

// GetIt 을 사용하면 수비게 종속성을 부여할 수 있음. 추후 usecase 등 작성 시에 사용 예정.
final GetIt injector = GetIt.instance;

const _apiKey = '2734ac3ed8cc0af18bd3ffc59ee98fb6';

Future<void> initializeInjector() async {
  
  final Dio dio = Dio();
  
  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler){
    logger.d('>>>>>>> extra: ${options.extra}');
    logger.d('>>>>>>> baseUrl: ${options.baseUrl}');
    logger.d('>>>>>>> uri: ${options.uri}');
    logger.d('>>>>>>> uri.path: ${options.uri.path}');
    logger.d('>>>>>>> method: ${options.method}');
    logger.d('>>>>>>> req data: ${options.data}');
    logger.d('>>>>>>> req data: ${options.listFormat.toString()}');

    options.connectTimeout = const Duration(seconds: 5);
    options.receiveTimeout = const Duration(seconds: 5);
    options.sendTimeout = const Duration(seconds: 5);
    options.headers['Authorization'] = 'KakaoAK $_apiKey';
    handler.next(options);
  }));

  // 메모리 누수를 줄이기 위해서는 되도록 singleton으로
  // 인젝션
  injector.registerSingleton<Dio>(dio);

  injector.registerSingleton<JvmApiServices>(JvmApiServices(injector()));
  injector.registerSingleton<JvmRepositories>(RepositoriesImplements(injector()));

  // usecase
  injector.registerSingleton(UsecaseCallSearchImage(injector()));
}