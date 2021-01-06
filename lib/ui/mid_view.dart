import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/model/weather_forecast5_model.dart';
import 'package:weather/util/weather_forecast_util.dart';

class MidView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast5Model>snapshot;
  const MidView({Key key, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name = snapshot.data.city.name;
  String description=snapshot.data.list[0].weather[0].description;
  var formatedDate =
      new DateTime.fromMillisecondsSinceEpoch(snapshot.data.list[0].dt * 1000);
    return  Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "${name}",
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
       Image.network("http://openweathermap.org/img/wn/${snapshot.data.list[0].weather[0].icon}@2x.png",width: 120,height: 120,),
       Text("${description}",style: TextStyle(fontSize: 30),
              ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Icon(
                FontAwesomeIcons.temperatureHigh,
                size:34,
              ),
              Text("${snapshot.data.list[0].main.temp.toStringAsFixed(1)}°C",style: TextStyle(
                fontSize: 34
              ),
              ),
              // Text(
              //   "${Util.changeTemp(snapshot.data.main.temp)}°C",
              //   style: TextStyle(fontSize: 34),
              // ),
              
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
                    Text("${Util.changeWind(snapshot.data.list[0].wind.speed)} km/h"),
                    Icon(
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
                    Text("${snapshot.data.list[0].main.humidity} %"),
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
  }
}
