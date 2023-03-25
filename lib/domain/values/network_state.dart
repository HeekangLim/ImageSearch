abstract class NetWorkState {
  const NetWorkState({this.msg});
  final String? msg;
}

class NetworkLoading extends NetWorkState {}

class NetworkError extends NetWorkState {
  const NetworkError(this.msg, this.e) : super(msg: msg);
  final String msg;
  final Exception e;
}

class NetworkSuccess extends NetWorkState {}
