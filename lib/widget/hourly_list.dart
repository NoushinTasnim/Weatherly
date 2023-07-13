import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weatherly/model/hour_data_info.dart';
import '../model/hour_update.dart';
import 'hourly_tile.dart';

class HourlyList extends StatelessWidget {

  final List<HourData> hourData;
  final String time;

  const HourlyList({super.key, required this.hourData, required this.time});

  @override
  Widget build(BuildContext context) {
    DateTime parsedTime = DateFormat('hh:mm a').parse(time);

    // Format the parsed time to get the hour in 12-hour format
    String currentHour = DateFormat('h a').format(parsedTime);
    return Consumer<HourDataInfo>(
        builder: (context, taskData, child){
          return ListView.builder(
            itemCount: 24,
            itemBuilder: (context, index) {
            return ListTileWidget(
              hour: hourData[index].hour == currentHour ? 'NOW' : hourData[index].hour,
              code: hourData[index].icon_no,
              temp: hourData[index].temp,
              temp1: 0,
              time: time,
              choosen: hourData[index].hour == currentHour ? 1 : 0,
            );
          },
            scrollDirection: Axis.horizontal,
          );
          },
    );
  }
}