import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter0822_01/rxdart/bloc_provider.dart';
import 'package:flutter0822_01/theme/app_theme.dart';
import 'package:flutter0822_01/locale/translations_delegate.dart';
import 'package:flutter0822_01/routes.dart';
import 'package:flutter0822_01/hello_world.dart';
import 'package:flutter0822_01/theme_data.dart';
import 'package:flutter0822_01/thirdpak.dart';
import 'package:flutter0822_01/login_page.dart';
import 'package:flutter0822_01/weather_page.dart';

void main() => runApp(BlocProvider(child: MyApp()));



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeSelect = BlocProvider.of(context);
    // TODO: implement build
    return StreamBuilder(
      builder: _builder,
      stream: themeSelect.value,
      initialData: false,
    );
  }


  Widget _builder(BuildContext context, AsyncSnapshot snapshot) {
    return new MaterialApp(
        title: 'Welcome to Flutter_Study',
        theme: snapshot.data ? AppTheme().darkTheme : AppTheme().lightTheme,
        localizationsDelegates: [
          const TranslationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [Locale("zh"), Locale("en")],
        home: Routes(),
        routes: {
          //静态路由，无法传参
          'route': (BuildContext context) =>  new Routes(),
          'helloworld':(BuildContext context) => new HomePage(),
          'themedata':(BuildContext context) => new ThemePage(),
          'thirdpak':(BuildContext context) => new ThirdPack(),
          'loginpage':(BuildContext context) => new LoginPage(),
          'weather':(BuildContext context) => new WeatherWidget(),
        },
    );
  }
}