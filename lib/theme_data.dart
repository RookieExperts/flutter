/**
主题的使用：
    Theme
 */
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

//class MyApp extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    final appName = '自定义主题';
//    // TODO: implement build
//    return new MaterialApp(
//      title: appName,
//      theme: new ThemeData(
//        brightness: Brightness.light,
//        primaryColor: Colors.lightBlue[600],
//        accentColor: Colors.orange[600],
//      ),
//      home: new ThemePage(),
//    );
//  }
//}

class ThemePage extends StatefulWidget{
  _ThemeDataPage createState() => _ThemeDataPage();
}

class _ThemeDataPage extends State<ThemePage>{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("自定义主题"),

      ),
      body: new Center(
        child: new Container(
          color: Theme.of(context).accentColor,
          child: new Text(
            '带有背景颜色的文本组件',
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
    );
  }
}