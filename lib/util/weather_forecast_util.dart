import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Util{
static String appId="420efbf15158b7594762130308261b16";
static String getFormatedData(DateTime dateTime){
return new DateFormat("EEE, MMM d, ''y"  ).format(dateTime);
}
static String changeTemp(double temp){
  double celTemp=(temp-273.15);
  return celTemp.toStringAsFixed(1);
}
static String changeWind(double wind){
  var speed=wind*1.609344;
  return speed.toStringAsFixed(0);
}

}