import 'dart:ui';

import 'package:intl/intl.dart';

import '../constants.dart';

class CurrentData {
  String city_name;
  double temp_c;
  String local_time, local_date;
  String condition;
  int is_day;
  String img, bg;
  Color font_color;

  CurrentData({
    required this.city_name,
    required this.temp_c,
    required this.local_time,
    required this.local_date,
    required this.condition,
    required this.is_day,
    required this.img,
    required this.bg,
    required this.font_color,
  });
}

CurrentData getCurrentData(weatherData) {
  if (weatherData == null) {
    CurrentData data = CurrentData(
      city_name: 'ERROR',
      temp_c: 0,
      local_time: '',
      local_date: '',
      condition: 'Unable to fetch data',
      is_day: 0,
      img: 'day',
      font_color: dark_font,
      bg: 'bg1',
    );
    // Access the data in other classes
    // Example: OtherClass.currentData = data;
    return data;
  }

  double tempC = weatherData['current']['temp_c'];
  String tempCFormatted = tempC.toInt().toString() + "°C";

  String mm = weatherData['location']['localtime'];
  DateFormat inputFormat = DateFormat('yyyy-MM-dd H:mm');
  DateFormat outputFormat = DateFormat('MMMM dd');
  DateFormat outputFormat2 = DateFormat('h:mm a');

  DateTime dateTime = inputFormat.parse(mm);

  String localDate = outputFormat.format(dateTime).toString();
  String localTime = outputFormat2.format(dateTime).toString();
  String cityName = weatherData['location']['name'];
  String condition = weatherData['current']['condition']['text'];
  int isDay = weatherData['current']['is_day'];
  String img = isDay == 1 ? 'day' : 'night';
  String bg = isDay == 1 ? 'bg1' : 'bg2';
  Color fontColor = isDay == 1 ? dark_font : light_font;

  return CurrentData(
    city_name: cityName,
    temp_c: tempC,
    local_time: localTime,
    local_date: localDate,
    condition: condition,
    is_day: isDay,
    img: img,
    font_color: fontColor,
    bg: bg,
  );

  // Access the data in other classes
  // Example: OtherClass.currentData = data;
}
