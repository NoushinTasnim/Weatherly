import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/current_data.dart';

class CurrentWeatherData extends StatelessWidget {
  const CurrentWeatherData({
    super.key,
    required this.data,
  });

  final CurrentData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              data.city_name,
              style: GoogleFonts.abhayaLibre(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: data.font_color,
              ),
            ),
            Text(
                '${data.temp_c.round()} °C',
                style:GoogleFonts.abhayaLibre(
                  fontWeight: FontWeight.w400,
                  fontSize: 64,
                  color: data.font_color,
                )
            ),
            SizedBox(
              height: 20,
            ),
            Text(
                data.condition,
                style: GoogleFonts.abhayaLibre(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  textStyle: TextStyle(
                    letterSpacing: 2,
                  ),
                  color: data.font_color,
                )
            ),
          ],
        ),
      ),
    );
  }
}