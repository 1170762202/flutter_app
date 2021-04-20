import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      body: build1(context),
    );
  }

  Widget build1(BuildContext context) {
    return Center(child: Text('首页${context.watch<CountNotify>().count}'));

    // child: Consumer<CountNotify>(builder: (context, notifier, child) {
    //     return Text('首页${notifier.count}');
    //   }),
    // );
    // return ChangeNotifierProvider(
    //   create: (_) {
    //     return CountNotify();
    //   },
    //   builder: (context, child) {},
    // );
    // return BlocBuilder<EntranceBloc, EntranceState>(builder: (context, state) {
    //   return Center(
    //     child: Text('首页${state.selectedIndex}   ${state.count}'),
    //   );
    // });
    // return BlocBuilder<EntranceCubit, EntranceCubitState>(
    //     builder: (context, state) {
    //   return Center(
    //     child: Text('首页${state.selectedIndex}'),
    //   );
    // });
  }
}
