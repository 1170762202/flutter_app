part of 'entrance_bloc.dart';

class EntranceState {
  int? selectedIndex;

  int? count;

  ///初始化方法,基础变量也需要赋初值,不然会报空异常
  EntranceState init() {
    return EntranceState()
      ..selectedIndex = 0
      ..count = 0;
  }

  ///clone方法,此方法实现参考fish_redux的clone方法
  ///也是对官方Flutter Login Tutorial这个demo中copyWith方法的一个优化
  ///Flutter Login Tutorial（https://bloclibrary.dev/#/flutterlogintutorial）
  EntranceState clone() {
    return EntranceState()
      ..selectedIndex = selectedIndex
      ..count = count;
  }
}
