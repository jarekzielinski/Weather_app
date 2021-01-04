import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/model/weather_forecast_model.dart';
import 'package:weather/util/convert_icon.dart';
import 'package:weather/util/weather_forecast_util.dart';


Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var country = snapshot.data.sys.country;
  var name = snapshot.data.name;
  String description=snapshot.data.weather[0].description;
  var formatedDate =
      new DateTime.fromMillisecondsSinceEpoch(snapshot.data.dt * 1000);
  Container midView = Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            "${name}, ${country}",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ),
        Text(
          "${Util.getFormatedData(formatedDate)}",
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(height: 10),
        // getWeatherIcon(weatherDescription:description,color: Colors.black87,size:198),
       Image.network("http://openweathermap.org/img/wn/${snapshot.data.weather[0].icon}@2x.png",width: 150,height: 150,),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text("${snapshot.data.main.temp.toStringAsFixed(1)}°C",style: TextStyle(
              //   fontSize: 34
              // ),
              // ),
              Icon(
                FontAwesomeIcons.temperatureHigh,
                size:34,
              ),
              Text(
                "${Util.changeTemp(snapshot.data.main.temp)}°C",
                style: TextStyle(fontSize: 34),
              ),
              Text("${snapshot.data.weather[0].description}",style: TextStyle(fontSize: 34),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${Util.changeWind(snapshot.data.wind.speed)} km/h"),
                    Icon(
                      // Icons.arrow_forward,
                      // size: 20,
                      // color: Colors.brown,
                      FontAwesomeIcons.wind,
                      size: 20,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("${snapshot.data.main.humidity} %"),
                    Icon(
                      FontAwesomeIcons.solidGrinBeamSweat,
                      size: 20,
                      color: Colors.brown,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
  return midView;
}
