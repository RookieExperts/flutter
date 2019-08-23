
import 'package:flutter/material.dart';
import 'package:flutter0822_01/rxdart/theme_select.dart';

class BlocProvider extends InheritedWidget{
  final ThemeSelect themeSelect = ThemeSelect();
  
  BlocProvider({Key key,Widget child}) : super(key: key,child: child);
  
  bool updateShouldNotify(_) => true;
  
  static ThemeSelect of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider)
        .themeSelect;
}
