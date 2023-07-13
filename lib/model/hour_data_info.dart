import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'hour_update.dart';

List<HourData> _hourData = [];

class HourDataInfo extends ChangeNotifier{

  List<HourData> addHourUpdate(weatherData){
    _hourData.clear();

    DateFormat inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    DateFormat outputFormat = DateFormat('h a');

    if (weatherData == null) {
      return _hourData;
    }

    var hourlyData = weatherData['forecast']['forecastday'][0]['hour'];
    for (var hourData in hourlyData) {
      HourData hourData1 = HourData(
          hour: outputFormat.format(inputFormat.parse(hourData['time'])).toString(),
          icon_no: hourData['condition']['icon'].replaceAll("//cdn.weatherapi.com/weather/64x64/", "images/"),
          temp: hourData['temp_c']);
      //print(hourData1);
      _hourData.add(
        hourData1
      );
    }
    return _hourData;
  }

}