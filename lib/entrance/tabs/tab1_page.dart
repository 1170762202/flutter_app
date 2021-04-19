import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/entrance/bloc/entrance_bloc.dart';
import 'package:flutter_app/entrance/cubit/entrance_cubit.dart';
import 'package:flutter_app/notify/count_notify.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

///@author: 张鲤仙
///@email: lixian.zhang@joymo.tech
///@created: 2021/4/16 3:37 PM

class Tab1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: build1(),
    );
  }

  Widget build1() {
    return Center(
      child: Consumer<CountNotify>(builder: (context, notifier, child) {
        return Text('首页${notifier.count}');
      }),
    );
    return ChangeNotifierProvider(
      create: (_) {
        return CountNotify();
      },
      builder: (context, child) {

      },
    );
    return BlocBuilder<EntranceBloc, EntranceState>(builder: (context, state) {
      return Center(
        child: Text('首页${state.selectedIndex}   ${state.count}'),
      );
    });
    return BlocBuilder<EntranceCubit, EntranceCubitState>(
        builder: (context, state) {
      return Center(
        child: Text('首页${state.selectedIndex}'),
      );
    });
  }
}
