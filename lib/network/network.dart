import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather/model/weather_forecast_model.dart';
import 'package:weather/util/weather_forecast_util.dart';

class Network{
  Future<WeatherForecastModel> getWeatherForecast({String cityName})async{
    // var finalUrl="http://api.openweathermap.org/data/2.5/weather?q=${cityName}&units=metric&appid=${Util.appId}";
    var finalUrl="http://api.openweathermap.org/data/2.5/weather?q="+cityName+"&appid="+Util.appId;
    // var finalUrl="http://api.openweathermap.org/data/2.5/forecast/daily?q="+cityName+"&appid="+Util.appId;



  final response= await get(Uri.encodeFull(finalUrl));

  // print("URL:${Uri.encodeFull(finalUrl)}");

  if(response.statusCode==200){
    print("Weather data: ${response.body}");
    return WeatherForecastModel.fromJson(json.decode(response.body));

  }else{
    throw Exception("Error");
  }

  }
}