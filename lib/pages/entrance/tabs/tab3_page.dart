import 'package:flutter/cupertino.dart';
import 'package:flutter_app/pages/entrance/bloc/entrance_bloc.dart';
import 'package:flutter_app/pages/entrance/cubit/entrance_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///@author: 张鲤仙
///@email: lixian.zhang@joymo.tech
///@created: 2021/4/16 3:37 PM

class Tab3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntranceBloc, EntranceState>(builder: (context, state) {
      return Center(
        child: Text('消息${state.selectedIndex}'),
      );
    });
    return BlocBuilder<EntranceCubit, EntranceCubitState>(
        builder: (context, state) {
      return Center(
        child: Text('消息${state.selectedIndex}'),
      );
    });
  }
}
