// 결과값을 돌려줄 추상 클래스 선언.

abstract class Result<T> {
  const Result({required this.code, this.data, this.msg, this.error});

  final T? data;
  final int code;
  final String? msg;
  final Exception? error;

  bool isSuccess() {
    return code == 200;
  }
}

class Success<T> extends Result<T> {
  const Success(T? data) : super(data: data, code: 200);
}

class Error<T> extends Result<T> {
  const Error(int code, String msg) : super(code: code, msg: msg);
}

class Failed<T> extends Result<T> {
  const Failed(int code, String msg, Exception error)
      : super(code: code, msg: msg, error: error);
}
