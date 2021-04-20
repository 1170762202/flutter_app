import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'entrance_event.dart';

part 'entrance_state.dart';

class EntranceBloc extends Bloc<EntranceEvent, EntranceState> {
  EntranceBloc() : super(EntranceState().init());

  @override
  Stream<EntranceState> mapEventToState(EntranceEvent event) async* {
    ///main_view中添加的事件，会在此处回调，此处处理完数据，将数据yield，BlocBuilder就会刷新组件
    if (event is EntranceInitEvent) {
      debugPrint('MainInitEvent');
      yield await init();
    } else if (event is SwitchTabEvent) {
      ///获取到event事件传递过来的值,咱们拿到这值塞进MainState中
      ///直接在state上改变内部的值,然后yield,只能触发一次BlocBuilder,它内部会比较上次MainState对象,如果相同,就不build
      yield switchTap(event);
    }else if(event is AddEvent){
      yield addCount(event);
    }
  }

  ///初始化操作,在网络请求的情况下,需要使用如此方法同步数据
  Future<EntranceState> init() async {
    return state.clone();
  }

  ///切换tab
  EntranceState switchTap(SwitchTabEvent event) {
    return state.clone()..selectedIndex = event.selectedIndex;
  }

  EntranceState addCount(AddEvent event) {
    return state.clone()..count = state.count! + 1;
  }
}
