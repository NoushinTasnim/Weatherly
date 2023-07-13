import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weatherly/Services/weather.dart';
import 'package:weatherly/constants.dart';
import 'package:weatherly/model/hour_data_info.dart';
import 'package:weatherly/model/weekly_data.dart';
import 'package:weatherly/widget/hourly_list.dart';
import '../model/hour_update.dart';
import '../model/weekly_data_model.dart';
import '../widget/current_time.dart';
import '../widget/current_weather.dart';
import '../widget/forecast_text_widget.dart';
import '../widget/my_location_weather.dart';
import '../widget/progress_widget.dart';
import '../widget/weekly_list.dart';
import 'city_screen.dart';
import '../model/current_data.dart';

class LocationScreen extends StatefulWidget {

  LocationScreen({this. locationData});

  final locationData;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  bool is_loading = false;
  late CurrentData data;
  List<HourData> hourData = [];
  List<WeekData> weekData = [];
  int hour_week = 1;

  void updateUI(dynamic weatherData) async{
    setState(() {
      data = getCurrentData(weatherData);
      is_loading = false;
      HourDataInfo hourDataInfo = HourDataInfo();
      WeekDataInfo weekDataInfo = WeekDataInfo();
      hourData = hourDataInfo.addHourUpdate(weatherData);
      weekData = weekDataInfo.addWeekUpdate(weatherData);
      print(weekData);
    });
  }

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/${data.bg}.png'), // Path to your image asset
                fit: BoxFit.cover, // Adjust the image fit as needed
              ),
            ),
            constraints: BoxConstraints.expand(),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Image(
                    width: double.infinity,
                    image: AssetImage('images/rec.png'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 100),
                  alignment: Alignment.center,
                    child: Image(
                      width: MediaQuery.of(context).size.width/1.25,
                      image: AssetImage('images/house2.png'),
                    ),
                ),
                SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LocationButton(
                                data: data,
                                onPressed: () async{
                                  is_loading = true;
                                  var weatherData = await WeatherData().getLocationWeather();
                                  updateUI(weatherData);
                                  //is_loading = false;
                                },
                              ),
                              CurrentTime(data: data),
                              searchButton(context),
                            ],
                          ),
                        ),
                        CurrentWeatherData(data: data),
                        SizedBox(
                          height: 120,
                        ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: double.infinity,
                    decoration: containerDec,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32.0),
                        topRight: Radius.circular(32.0),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                data.is_day == true ? day_col1 : night_col1,
                                data.is_day == true ? day_col2 : night_col2,
                              ],
                            ),
                            color: Color(0xffffffff).withOpacity(0.33),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children:[
                                    InkWell(
                                      onTap: (){
                                        setState(() {
                                          if(hour_week==0)
                                            hour_week=1;
                                          print(hour_week);
                                        });
                                      },
                                      child: ForecastText(
                                        text: 'Hourly Forecast',
                                        hour_week: hour_week,
                                        data: data,
                                        current: 1,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        setState(() {
                                          if(hour_week==1)
                                            hour_week=0;
                                          print(hour_week);
                                        });
                                      },
                                      child: ForecastText(
                                        text: 'Weekly Forecast',
                                        hour_week: hour_week,
                                        data: data,
                                        current: 0,
                                      ),
                                    ),
                                  ]
                                ),
                                divider,
                                Expanded(
                                  child: hour_week==1
                                      ? HourlyList(
                                          hourData: hourData,
                                          time: data.local_time,
                                        )
                                      : WeeklyList(
                                          weekData: weekData,
                                          time: data.local_time,
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    )
    ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if(is_loading)
            ShowProgressWidget(data: data),
        ],
      ),
    );
  }
  Container searchButton(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: MaterialButton(
        onPressed: () async{
          is_loading = true;
          var typedName = await Navigator.push(
            context, MaterialPageRoute(
            builder: (context){
              return CityScreen();
            },
          ),
          );
          if(typedName!=null){
            var weatherData = await WeatherData().getCityWeather(typedName);
            updateUI(weatherData);
          }
        },
        child: Icon(
          Icons.search,
          size: 30.0,
          color: data.font_color,
        ),
      ),
    );
  }
}