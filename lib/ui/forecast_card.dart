
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/model/weather_forecast5_model.dart';
import 'package:weather/util/weather_forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecast5Model>snapshot,int index){
 var forecastList=snapshot.data.list;
 var dayOfWeek="";
 var time="";
 DateTime date=new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt*1000);
 var fullDate=Util.getFormatedData(date);
 dayOfWeek=fullDate.split(",")[0];
 time=Util.getFormatedHour(date);
 return Column(
   mainAxisAlignment: MainAxisAlignment.start,
   crossAxisAlignment: CrossAxisAlignment.start,
   children: [
     Padding(
       padding: const EdgeInsets.all(8.0),
       child: Center(child:Column(
         children: [
         Text(dayOfWeek),
         Text(time)  
         ],
       ) ),
     ),
     Row(
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
         CircleAvatar(
           radius:33,
           backgroundColor: Colors.white,
           child: Image.network("http://openweathermap.org/img/wn/${forecastList[index].weather[0].icon}@2x.png",width: 120,height: 120,),
         ),
         Column(
       children: [
         Padding(
           padding: const EdgeInsets.only(left:8.0),
           child: Row(
             children: [
               Text("${forecastList[index].main.tempMin.toStringAsFixed(0)}°C"),
               Icon(FontAwesomeIcons.solidArrowAltCircleDown,color: Colors.white,size: 17,),
             ],
           ),
         ),
         
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Row(
              children: [
                Text("${forecastList[index].main.tempMax.toStringAsFixed(0)}°C"),
                Icon(FontAwesomeIcons.solidArrowAltCircleUp,color: Colors.white,size: 17,),
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Row(
              children: [
                Text("Hum:${forecastList[index].main.humidity.toStringAsFixed(0)}%"),
                Icon(FontAwesomeIcons.solidGrinBeamSweat,color: Colors.white,size: 17,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Row(
              children: [
                Text("Win:${forecastList[index].wind.speed.toStringAsFixed(1)}km/h"),
                Icon(FontAwesomeIcons.wind,color: Colors.white,size: 17,),
              ],
            ),
          ),
          
          
       ],
     )
       ],
     ),
     
   ],
 ); 
}