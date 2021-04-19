import 'package:flutter/material.dart';

///@author: 张鲤仙
///@email: lixian.zhang@joymo.tech
///@created: 2021/4/19 2:39 PM
class CountNotify extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void addCount() {
    _count++;
    notifyListeners();
  }
}
