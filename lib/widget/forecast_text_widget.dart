import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/current_data.dart';

class ForecastText extends StatelessWidget {
  const ForecastText({
    super.key,
    required this.hour_week,
    required this.data,
    required this.current,
    required this.text,
  });

  final int hour_week;
  final CurrentData data;
  final int current;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.istokWeb(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        textStyle: TextStyle(
          letterSpacing: 2,
        ),
        color: hour_week==current
            ? data.font_color
            : data.font_color.withOpacity(0.33),
      ),
    );
  }
}
