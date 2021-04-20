part of 'entrance_cubit.dart';

class EntranceCubitState {
  int? selectedIndex;

  EntranceCubitState init() {
    return EntranceCubitState()..selectedIndex = 0;
  }

  EntranceCubitState clone() {
    return EntranceCubitState()..selectedIndex = selectedIndex;
  }
}
