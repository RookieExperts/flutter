/*
flutter的第一个项目实例
 */

import 'package:flutter/material.dart';

class CwmsWidget extends StatefulWidget{
  State<CwmsWidget> createState() => CwmsWidgetState();
}

class CwmsWidgetState extends State<CwmsWidget>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          Container(
            height: 200.0,
            color: Colors.green[200],
            child: new Row(
               children: <Widget>[
                 new Container(
                   margin:EdgeInsets.only(left:20.0,bottom: 10),
                   child: new ClipOval(
                     child: Image.asset(
                       "images/头像.jpg",
                       width: 60.0,
                       height: 60.0,
                       fit: BoxFit.cover,
                     ),
                   ),
                 ),
                 new Container(
                   margin: EdgeInsets.only(top:70.0,left:15.0),
                   child: new Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       new Container(

                         child: new Text(
                           "王大治",
                           style: new TextStyle(
                             fontSize: 20,
                             color: Colors.white,
                           ),
                         ),
                       ),
                       new Container(
                         margin: EdgeInsets.only(top: 8.0),
                         child: new Text(
                           "信息科技部-管库员",
                           textAlign: TextAlign.left,
                           style: new TextStyle(
                             fontSize: 10,
                             color: Colors.white,
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
                 new Container(
                   margin: EdgeInsets.only(left: 140),
                   child: new Icon(Icons.settings,color: Colors.white,),
                 ),
               ],
            ),
          ),
          Container(
            height: 180.0,
            margin: EdgeInsets.only(top:140.0,left: 8.0,right: 8.0),
            
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: new Border.all(width: 1,color: Colors.white),
              boxShadow: [
                //BoxShadow(color: Color(0x99FFFF00), offset: Offset(5.0, 5.0),    blurRadius: 10.0, spreadRadius: 2.0),
                BoxShadow(color: Color(0x99DFC8F2), offset: Offset(1.0, 1.0),blurRadius: 10.0, spreadRadius: 2.0)],
            ),
//            child: new Row(
//              children: <Widget>[
//                new Container(
//                  child: Image.asset(
//                    "images/背景图.jpg",
//                    width: 150.0,
//                    height: 180.0,
//                    fit: BoxFit.fill,
//                  ),
//                ),
//                new Container(
//
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      new Container(
//                        alignment:Alignment.center,
//                        child: Text(
//                          '便捷操作 高效办公',
//                          style: new TextStyle(
//                            fontSize: 20,
//                            color: Color(0x9966D1CF),
//                          ),
//                        ),
//                      ),
//                      new Container(
//                        child: Text(
//                          "让你的工作又快又轻松的完成",
//                          style: new TextStyle(
//                            fontSize: 5.0,
//
//                          ),
//                        ),
//                      ),
//                    ],
//                  )
//                ),
//              ],
//            ),

          ),
          Container(
            height: 180.0,
            margin: EdgeInsets.only(top:330.0,left: 8.0,right: 8.0),

            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: new Border.all(width: 1,color: Colors.white),
              boxShadow: [
                //BoxShadow(color: Color(0x99FFFF00), offset: Offset(5.0, 5.0),    blurRadius: 10.0, spreadRadius: 2.0),
                BoxShadow(color: Color(0x99DCF9F2), offset: Offset(1.0, 1.0),blurRadius: 10.0, spreadRadius: 2.0)],

            ),
            child: Row(
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text(
                              "图片"
                            ),
                          ),
                          Container(
                            child: Text(
                              "发票夹",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}