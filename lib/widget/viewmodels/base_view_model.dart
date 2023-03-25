import 'package:flutter/material.dart';
import 'package:jvn_project/domain/usecases/base_usecase.dart';
import 'package:jvn_project/domain/values/network_state.dart';
import 'package:jvn_project/domain/values/result.dart';
import 'package:jvn_project/options/initializer.dart';

enum CallResult {
  success,    // 성공
  error,      // 실패 (에러 발생)
}

// MVVM, ViewModel > ChangeNotifier를 상속 받아 상태 변경시 refresh
class BaseViewModel extends ChangeNotifier {
  NetWorkState _netWorkState = NetworkSuccess();
  NetWorkState get netWorkState => _netWorkState;

  // 기본 뷰 모델 선언하여 기본동작들 선언

  void hideLoading() {
    _netWorkState = NetworkSuccess();
    notifyListeners();
  }

  void showLoading() {
    _netWorkState = NetworkLoading();
    notifyListeners();
  }

  void showNetError(Exception e) {
    _netWorkState = NetworkError('error', e);
    notifyListeners();
  }

  void notify() {
    notifyListeners();
  }

  Future<R> restApiCall<P, R>(BaseUseCase<P, R> useCase, [P? parameter]) async {
    showLoading();
    final result = await useCase.call(parameter);
    hideLoading();

    // result 받고 나면 갱신.
    notify();
    return result;
  }

  Future<Result<R>?> netWorkCall<P, R>(BaseUseCase<P, Result<R>> useCase, [P? parameter]) async {
    showLoading();
    return useCase.getResult(onError, parameter).then((Result<R>? value) {
      logger.d('then ${value?.data}');
      hideLoading();
      return value;
    }).whenComplete(() {
      // logger.d('whenComplete');
      //hideLoading();
    });
  }

  void onError(Exception e) {
    // logger.e('onError :  ${e.toString()}');
    hideLoading();
    // _netWorkState = NetworkError('error', e);
    notifyListeners();
  }
}
