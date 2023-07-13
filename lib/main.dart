import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherly/Screens/city_screen.dart';
import 'package:weatherly/Screens/loading_screen.dart';
import 'package:weatherly/model/hour_update.dart';

import 'model/hour_data_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HourDataInfo(),
        child: MaterialApp(
          theme: ThemeData.dark(),
          home: LoadingScreen(),
        ),
    );
  }
}
