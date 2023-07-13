import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:weatherly/model/weekly_data_model.dart';

List<WeekData> _weekData = [];

class WeekDataInfo extends ChangeNotifier{

  List<WeekData> addWeekUpdate(weatherData){

    _weekData.clear();

    if (weatherData == null) {
      return _weekData;
    }

    var weeklyData = weatherData['forecast']['forecastday'];
    print(weeklyData);
    DateFormat inputFormat = DateFormat('yyyy-MM-dd');
    for (var weekData in weeklyData) {
      print('aasasasasas');
      _weekData.add(
          WeekData(
            date: inputFormat.parse(weekData['date']),
            icon_no: weekData['day']['condition']['icon'].replaceAll("//cdn.weatherapi.com/weather/64x64/", "images/"),
            temp_max: weekData['day']['maxtemp_c'],
            temp_min: weekData['day']['mintemp_c']
          ),
      );
      print(_weekData[_weekData.length-1].temp_max);
    }
    return _weekData;
  }

}