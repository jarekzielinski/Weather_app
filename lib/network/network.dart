import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather/model/weather_forecast5_model.dart';
import 'package:weather/util/weather_forecast_util.dart';

class Network{
  Future<WeatherForecast5Model> getWeatherForecast({String cityName})async{
    var finalUrl="http://api.openweathermap.org/data/2.5/forecast?q="+cityName+"&units=metric"+"&appid="+Util.appId;//5 dniowa



  final response= await get(Uri.encodeFull(finalUrl));

  print("URL:${Uri.encodeFull(finalUrl)}");

  if(response.statusCode==200){
    // print("Weather data: ${response.body}");
    return WeatherForecast5Model.fromJson(json.decode(response.body));

  }else{
    throw Exception("Error");
  }

  }
}