import 'package:flutter/material.dart';
import 'package:weather/model/weather_forecast_model.dart';
import 'package:weather/network/network.dart';
import 'package:weather/ui/mid_view.dart';

class WeatherForecast extends StatefulWidget {
 WeatherForecast({Key key}) : super(key: key);

  @override
   WeatherForecastState createState() =>  WeatherForecastState();
}

class  WeatherForecastState extends State<WeatherForecast> {
Future<WeatherForecastModel> forecastObject;
String _cityName="Warszawa";
@override
  void initState() {
    super.initState();
    forecastObject=getWeather(cityName:_cityName);
    // forecastObject.then((weather) => {
      // print(weather.main)
    // });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Forecast"),
      //   centerTitle: true,
      // ),
      body: ListView(
        children: [
          textFieldView(),
          Container(
            child: FutureBuilder<WeatherForecastModel>(future:forecastObject,builder:(BuildContext context,AsyncSnapshot<WeatherForecastModel> snapshot){
if(snapshot.hasData){
return Column(
  children: [
    midView(snapshot)
  ],
);
}else{
  return Container(
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
            }),

          ),
                   
                  ],
                ),
              );
            }
          
            Widget textFieldView() {
              return Container(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter city name",
                    prefixIcon: Icon(Icons.search),
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                      contentPadding: EdgeInsets.all(8),
                  ),
                  onSubmitted: (value){
                    setState(() {
                      _cityName=value;
                      forecastObject=getWeather(cityName: _cityName);
                    });
                  },
                ),
              );

            }
            Future<WeatherForecastModel>getWeather({String cityName})=>
            new Network().getWeatherForecast(cityName: _cityName);
}