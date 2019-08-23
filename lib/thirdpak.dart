
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class ThirdPack extends StatefulWidget{
  @override
  _ThirdPackPage createState() => _ThirdPackPage();
}

class _ThirdPackPage extends State<ThirdPack>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('使用第三方包示例'),
      ),
      body: new Center(
        child: new RaisedButton(
            onPressed: (){
              const url = 'https://www.baidu.com';
              launch(url);
            },
            child:new Text('打开百度'),),
      ),
    );
  }

}