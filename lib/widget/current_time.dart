import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherly/model/current_data.dart';

class CurrentTime extends StatelessWidget {
  const CurrentTime({
    super.key,
    required this.data,
  });

  final CurrentData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        data.local_time +"\n" + data.local_date,
        style: GoogleFonts.abhayaLibre(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: data.font_color,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}