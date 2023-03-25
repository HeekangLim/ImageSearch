import 'package:flutter/material.dart';
import 'package:jvn_project/domain/values/network_state.dart';
import 'package:jvn_project/options/initializer.dart';
import 'package:jvn_project/widget/viewmodels/base_view_model.dart';
import 'package:provider/provider.dart';

typedef WidgetBuilder<T> = Widget Function(BuildContext context, T model, Widget? child);

/**
 * 기본으로 삼을 widget,인자값으로 viewmodel및 builder 를 받아서 사용,
 * viewmodel 은 changenotifier 기반 class
 */
class BaseWidget<T extends BaseViewModel> extends StatefulWidget {

  BaseWidget({Key? key,
    required this.viewmodel,
    required this.builder,
    this.onPostFrameAdded,
    this.onPostDataSeted,
    this.onResume,
    this.onPause,
    this.data,
  }) : super(key: key);

  final T viewmodel;
  final WidgetBuilder<T> builder;
  final Function(T)? onPostFrameAdded;
  final Function(T)? onPostDataSeted;
  final VoidCallback? onResume;
  final VoidCallback? onPause;
  final Object? data;
  
  // List<Provider>? providers;

  // 소비할 위젯 반환 함수 형태로
  // final Widget Function(Widget Function(Widget child) widget) consumer;

  @override
  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

// 위젯 바인딩을 주시하기 위해 observer를 달아둠.
class _BaseWidgetState<T extends BaseViewModel>
    extends State<BaseWidget<T>> with WidgetsBindingObserver {

  // 검색창 처음 노출시 키보드 노출
  bool _isKeyboardVisible = false;

  @override
  Widget build(BuildContext context) {
    checkKeyboard(context);
    return ChangeNotifierProvider<T>(
        create: (_) => widget.viewmodel,
      // 내부에서 소비한다.
        child: Consumer<T>(

        builder: (context, viewModel, child) =>
        // progress 표시를 위해 Stack 으로 두고 children 에 Gesture 를 detect 하기 위해 GestureDetector 을 둔다.
            Stack(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  // 빌더에서 받은 context, viewmodel, child를 이용하여 실제 노출될 builder를 생성
                  child: widget.builder(context, viewModel, child),
                ),

                // 상태에 따른 위젯 프로그래스 바 표
                _widgetProgress(context, viewModel)
              ],
            )
        )
      );
  }

  @override
  void initState() {
    // 바인딩 옵저빙 해서 알려주기 위함.
    WidgetsBinding.instance?.addObserver(this);
    // 처음 프레임이 add 되었을 때 호출,
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (widget.onPostFrameAdded != null) {
        // 처음 진입 시 getData 수행 하여 notify 되도록 할 필요 없어.
        // widget.viewmodel.restApiCall(widget.data);

        // init 시에 위젯에 알려준다.
        widget.onPostFrameAdded!(widget.viewmodel);
      }
    });
    super.initState();
  }

  Widget _widgetProgress(BuildContext context, BaseViewModel viewModel) {
    final netWorkState = viewModel.netWorkState;
    return Visibility(
      visible: netWorkState is NetworkLoading,
      child: Container (
        alignment: Alignment.center,
        child: const CircularProgressIndicator(

        strokeWidth: 5,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      ),),

    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        logger.d('AppLifecycleState.resumed');
        if (widget.onResume != null) widget.onResume!();
        break;
      case AppLifecycleState.paused:
        logger.d('AppLifecycleState.paused');
        if (widget.onResume != null) widget.onPause!();
        break;
      case AppLifecycleState.inactive:
        logger.d('AppLifecycleState.inactive');
        break;
      case AppLifecycleState.detached:
        logger.d('AppLifecycleState.detached');
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    // dispose 되면 observer 해제
    WidgetsBinding.instance.removeObserver(this);
    logger.d('AppLifecycleState.dispose');
    super.dispose();
  }

  void checkKeyboard(BuildContext context) {
    bool isVisible = false;
    if(MediaQuery.of(context).viewInsets.bottom == 0.0) {
      isVisible = false;
    }else {
      isVisible = true;
    }
    if(_isKeyboardVisible != isVisible) {
      _isKeyboardVisible = isVisible;
      if(!isVisible) {
        logger.d('keyboard unfocus');
        FocusScope.of(context).unfocus();
      }
    }
  }
}