/**
 *  author: 0&1 on 2019/08/22
 *  rxdart 实现主题切换
 */

import 'dart:async';
import 'package:rxdart/rxdart.dart';

class ThemeSelect{
  bool isNight = false;

  var _subject = BehaviorSubject<bool>();

  Stream<bool> get value => _subject.stream;

  void changeTheme(bool value) => _subject.add(value);

  void dispose(){
    _subject.close();
  }
}
