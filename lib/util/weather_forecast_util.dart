import 'package:intl/intl.dart';

class Util{
static String appId="...";
static String getFormatedData(DateTime dateTime){
return new DateFormat("EEEE, MMM d, ''y"  ).format(dateTime);
}
static String getFormatedHour(DateTime dateTime){
  return new DateFormat("h:mm a").format(dateTime);
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
