/*
 * create by brb on 20190826
 * 登录页面
 *
 *
*/
import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  //初始化FormState
  final _formKey = GlobalKey<FormState>();
  // 定义用户名、密码( _ -表示私有变量)
  String _email,_password;
  bool _isObscure = true;
  Color _eyeColor;
  //登录的方式
  List _LoginMethod =[
    {
      "title":"facebook",
      "icon":GroovinMaterialIcons.facebook,
    },
    {
      "title":"google",
      "icon":GroovinMaterialIcons.google,
    },
    {
      "title":"twitter",
      "icon":GroovinMaterialIcons.twitter,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 22.0),
          children: <Widget>[
            SizedBox(
              height: kToolbarHeight,
            ),
            buildTitle(),
            buildTitleLine(),
            SizedBox(height: 70.0),
            buildEmailTextField(),
            SizedBox(height: 30.0),
            buildPasswordTextField(context),
            buildForgetPasswordText(context),
            SizedBox(height: 60.0),
            buildLoginButton(context),
            SizedBox(height: 30.0),
            buildOtherLoginText(),
            buildOtherMethod(context),
            buildRegisterText(context),
          ],
        ),
      ),
    );
  }
  Align buildRegisterText(BuildContext context){
    return Align(
      alignment: Alignment.center,
      child: Padding(
          padding: EdgeInsets.only(top:10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('没有账号？'),
            GestureDetector(
              child: Text(
                '点击注册',
                style: TextStyle(color: Colors.green),
              ),
              onTap: (){
                //跳转到注册页面
                print('去注册');
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
  ButtonBar buildOtherMethod(BuildContext context){
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: _LoginMethod
        .map((item) => Builder(
        builder: (context){
          return IconButton(
            icon: Icon(item['icon'],
            color: Theme.of(context).iconTheme.color),
            onPressed: (){
              //第三方登录
              Scaffold.of(context).showSnackBar(new SnackBar(
                  content: new Text("${item['title']}登录"),
                action: new SnackBarAction(
                    label: "取消",
                    onPressed: (){},
                ),
              ));
            });
        },
      ))
        .toList(),
    );
  }

  Align buildOtherLoginText(){
    return Align(
      alignment: Alignment.center,
      child: Text(
        '其他账号登录',
        style: TextStyle(color: Colors.grey, fontSize: 14.0),
      ),
    );
  }

  /**
   * button登录按钮
   */
  Align buildLoginButton(BuildContext context){
    return Align(
      child: SizedBox(
        height: 45.0,
        width: 270.0,
        child: RaisedButton(
            child: Text(
              'Login',
              style: Theme.of(context).primaryTextTheme.headline,
            ),
            color: Colors.black,
            onPressed: (){
              if (_formKey.currentState.validate()){
                //只有输入的内容符合要求通过才会到达此处
                _formKey.currentState.save();
                //执行登录方法
                print('email:$_email,assword:$_password');
              }
            },
          shape: StadiumBorder(side: BorderSide()),
        ),
      ),
    );
  }

  /**
   * 忘记密码
   */
  Padding buildForgetPasswordText(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Align(
        alignment: Alignment.centerRight,//靠右边展示
        child: FlatButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text(
              '忘记密码？',
              style: TextStyle(fontSize: 14.0,color: Colors.grey),
            )),
      ),
    );
  }

  /**
   * 密码输入框
   */
  TextFormField buildPasswordTextField(BuildContext context){
    return TextFormField(
      onSaved: (String value) => _password = value,
      obscureText: _isObscure,
      validator: (String value){
        if (value.isEmpty){
          return '请输入密码';
        }
      },
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: IconButton(
            icon: Icon(
              Icons.remove_red_eye,
              color: _eyeColor,
            ),
            onPressed: (){
              setState(() {
                _isObscure = !_isObscure;
                _eyeColor = _isObscure ? Colors.grey :Theme.of(context).iconTheme.color;
              });
            })
      ),
    );
  }

  /**
   * Email文本框
   */
  TextFormField buildEmailTextField(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Emall Address',
      ),
      validator: (String value){
        //正则表达式，验证邮箱地址是否合法
        var emailReg = RegExp(
            r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
        if(!emailReg.hasMatch(value)){
          return '请输入正确的邮箱地址';
        }
      },
      onSaved: (String value) => _email = value,
    );
  }

  /**
   * 登录文字下面的下划线
   */
  Padding buildTitleLine(){
    return Padding(
      padding: EdgeInsets.only(left: 12.0,top: 4.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          color: Colors.black,
          width: 100.0,
          height: 2.0,
        ),
      ),
    );
  }
  /*
  登录文字
   */
  Padding buildTitle(){
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        '登录',
        style: TextStyle(fontSize: 42.0),
      ),
    );
  }

}