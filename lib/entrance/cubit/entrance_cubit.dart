import 'package:bloc/bloc.dart';

part 'entrance_state.dart';

class EntranceCubit extends Cubit<EntranceCubitState> {
  EntranceCubit() : super(EntranceCubitState().init());

  void switchTab(int selectedIndex) {
    emit(state.clone()..selectedIndex = selectedIndex);
  }
}
