import 'package:flutter/material.dart';
import 'package:flutter0822_01/locale/translations_delegate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Routes extends StatelessWidget{
  List<ListItem> listData;

  void initData(BuildContext context){
    listData = [];
    listData.add(ListItem(
      Translations.of(context).text('homePage'),"Home",Icons.home));
    listData.add(ListItem("你好，世界", "helloworld", Icons.grade));
    listData.add(ListItem("使用主题", "themedata", Icons.grade));
    listData.add(ListItem("第三方包使用示例","thirdpak",Icons.grade));
  }
  Widget build(BuildContext context){
    initData(context);

    ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('列表'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemBuilder: (BuildContext context,int index){
            return ListItemWidget(listData[index]);
          },
        itemCount: listData.length,
      ),
    );
  }
}

class ListItem {
  final String title;
  final String routeName;
  final IconData iconData;
  ListItem(this.title,this.routeName,this.iconData);
}

class ListItemWidget extends StatelessWidget{
  final ListItem listItem;

  ListItemWidget(this.listItem);

  @override
  Widget build(BuildContext context){

    return ListTile(
      title: Text(listItem.title),
      leading: Icon(listItem.iconData),
      trailing: Icon(Icons.arrow_forward),
      onTap: (){
        //Navigator.pushNamed(context, listItem.routeName);
        enterDetail(context, listItem.routeName);
      },
    );
  }

  enterDetail(BuildContext context, String routeName) async{
     Navigator.of(context).pushNamed(routeName);
  }
}