// 기본이 될 추상 클래스 선언.

import 'package:jvn_project/domain/values/result.dart';
import 'package:jvn_project/options/initializer.dart';

abstract class BaseUseCase<P, R> {
  // Future<R> call([P? params]);
  Future<R> call(P? params);

  Future<R?> getResult(Function onError, [P? params]) {

    // call 후 result 받음
    return call(params).then((it) {
      // logger.d('getResult $it');
      if (it is Failed) {
        onError(it.error);
        return null;
      }
      return it;
    }).catchError((e) {
      logger.d('catchError');
      onError(e);
      return null;
    });
  }
}
