import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weatherly/model/hour_data_info.dart';
import 'package:weatherly/model/weekly_data_model.dart';
import 'hourly_tile.dart';

class WeeklyList extends StatelessWidget {

  final List<WeekData> weekData;
  final String time;

  const WeeklyList({
    super.key,
    required this.weekData,
    required this.time
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HourDataInfo>(
      builder: (context, taskData, child){
        return ListView.builder(
          itemCount: weekData.length,
          itemBuilder: (context, index) {
            return ListTileWidget(
              hour: DateFormat.E().format(weekData[index].date),
              code: weekData[index].icon_no,
              temp: weekData[index].temp_max,
              temp1: weekData[index].temp_min,
              time: time,
              choosen: 0,
            );
          },
          scrollDirection: Axis.horizontal,
        );
      },
    );
  }
}