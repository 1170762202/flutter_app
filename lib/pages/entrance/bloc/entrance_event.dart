part of 'entrance_bloc.dart';

@immutable
abstract class EntranceEvent {}

///初始化事件,暂时没啥用
class EntranceInitEvent extends EntranceEvent {}

///切换tab
class SwitchTabEvent extends EntranceEvent {
  final int selectedIndex;

  SwitchTabEvent({required this.selectedIndex});
}

class AddEvent extends EntranceEvent {
  final int count;

  AddEvent({required this.count});
}
