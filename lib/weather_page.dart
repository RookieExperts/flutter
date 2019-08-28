import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class WeatherWidget extends StatefulWidget{
  State <StatefulWidget> createState(){
    return new WeatherState();
  }
}

class WeatherState extends State<WeatherWidget>{

  WeatherData weather = WeatherData.empty();

  WeatherState(){
    _getWeather();
  }

  void _getWeather() async{
    WeatherData data = await _fetchWeather();
    setState(() {
      weather = data;
    });
  }

  Future<WeatherData> _fetchWeather() async{
    final response = await http.get('https://www.tianqiapi.com/api/?version=v1&cityid=101110101&appid=1001&appsecret=5566');
    //解决中文乱码
    Utf8Decoder decode = new Utf8Decoder();

    //print(json.decode(decode.convert(response.bodyBytes)));
    return WeatherData.fromJson(json.decode(decode.convert(response.bodyBytes)));

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image.asset("images/weather.jpg",fit: BoxFit.fitHeight,),
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 30.0),

                child: new Text(
                  weather?.city,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
              new Container(
                width: double.infinity,
                  margin: EdgeInsets.only(top: 50.0),
                child: new Column(

                  children: <Widget>[
                    new Text(
                       weather?.cond,

                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 45.0,

                      )),
                    new Text(
                      weather?.tmp,
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 25.0
                      )),
                    new Text(
                      weather?.air_level,
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 15.0
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class WeatherData{
  String city;  //城市
  String cond;  //天气
  String tmp;   //温度
  String air_level;   //空气状况

  WeatherData({this.city,this.cond,this.tmp,this.air_level});

  factory WeatherData.fromJson(Map<String,dynamic> json){
    return WeatherData(
      city: json['city'],
      cond: json['data'][0]['wea'],

      tmp: json['data'][0]['tem'],
      air_level: "空气 "+json['data'][0]['air_level'],
    );
  }
  factory WeatherData.empty (){
    return WeatherData(
      city: "",
      cond: "",
      tmp: "",
      air_level: "",
    );
  }
}