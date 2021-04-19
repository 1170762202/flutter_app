import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/entrance/tabs/tab1_page.dart';
import 'package:flutter_app/entrance/tabs/tab2_page.dart';
import 'package:flutter_app/entrance/tabs/tab3_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/entrance_bloc.dart';

///@author: 张鲤仙
///@email: lixian.zhang@joymo.tech
///@created: 2021/4/16 4:13 PM

class EntrancePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EntrancePageState();
  }
}

class EntrancePageState extends State<EntrancePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => EntranceBloc()..add(EntranceInitEvent()),
      child: BodyPage(),
    );
  }
}

Image getTabImage(String path) =>
    Image.asset(path, width: 28.0.w, height: 28.0.h, fit: BoxFit.cover);

// ignore: must_be_immutable
class BodyPage extends StatelessWidget {
  List tabbarConfig = [
    {
      'title': '首页',
      'icon': [
        getTabImage('assets/images/tabbar/news.png'),
        getTabImage('assets/images/tabbar/news_active.png')
      ],
      'page': Tab1Page()
    },
    {
      'title': '工作台',
      'icon': [
        getTabImage('assets/images/tabbar/menu.png'),
        getTabImage('assets/images/tabbar/menu_active.png')
      ],
      'page': Tab2Page()
    },
    {
      'title': '消息',
      'icon': [
        getTabImage('assets/images/tabbar/message.png'),
        getTabImage('assets/images/tabbar/message_active.png')
      ],
      'page': Tab3Page()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntranceBloc, EntranceState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(title: Text('Bloc')),
        body: tabbarConfig[state.selectedIndex!]["page"],
        bottomNavigationBar: bottomNavigation(),
      );
    });
  }

  Widget bottomNavigation() {
    return BlocBuilder<EntranceBloc, EntranceState>(builder: (context, state) {
      return Container(
        child: BottomNavigationBar(
          onTap: (index) {
            debugPrint('当前页：$index');
            BlocProvider.of<EntranceBloc>(context)
                .add(SwitchTabEvent(selectedIndex: index));
            BlocProvider.of<EntranceBloc>(context)
                .add(AddEvent(count: index));

          },
          elevation: 5,
          currentIndex: state.selectedIndex!,
          items: tabbarConfig.map((item) {
            return BottomNavigationBarItem(
                icon: item['icon'][0],
                activeIcon: item['icon'][1],
                label: item['title']);
          }).toList(),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xffFF51B431),
          unselectedItemColor: Color(0xffFF999990),
          unselectedLabelStyle: TextStyle(
              fontSize: 15.nsp),
          selectedLabelStyle: TextStyle(
              fontSize: 15.nsp),
        ),
      );
    });
  }
}
