import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weatherly/constants.dart';

class ListTileWidget extends StatelessWidget {

  bool isChecked = false;
  final String hour;
  final String code;
  final double temp;
  final double temp1;
  final String time;
  final int choosen;

  ListTileWidget({
    super.key,
    required this.hour,
    required this.code,
    required this.temp,
    required this.temp1,
    required this.time,
    required this.choosen
  });

  @override
  Widget build(BuildContext context) {
    DateTime parsedTime = DateFormat('hh:mm a').parse(time);

    // Format the parsed time to get the hour in 12-hour format
    String currentHour = DateFormat('h a').format(parsedTime);
    //print(currentHour);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              choosen == 1 ? tile_dark_sel1 : tile_dark1,
              choosen == 1 ? tile_dark_sel2 : tile_dark2,
            ],
          ),
          color: Colors.white.withOpacity(0.7),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(-5, -4),
            ),
            BoxShadow(
              color: Colors.white.withOpacity(0.1),
              blurRadius: 0,
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(48),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                '$hour',
                style: GoogleFonts.abhayaLibre(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: light_font,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height*0.3,
                child: Image.asset(
                  '$code',
                ),
              ),
            ),
            temp1 == 0
                ? Expanded(
                  child: Text(
                    '${temp.round()}°',
                    style: GoogleFonts.abhayaLibre(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: light_font,
                    ),
                  ),
                )
              : Expanded(
                child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Min:',
                        style: GoogleFonts.abhayaLibre(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: light_font,
                        ),
                      ),
                      Text(
                        '${temp1.round()}°C',
                        style: GoogleFonts.abhayaLibre(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: light_font,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Max:',
                        style: GoogleFonts.abhayaLibre(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: light_font,
                        ),
                      ),
                      Text(
                        '${temp.round()}°C',
                        style: GoogleFonts.abhayaLibre(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: light_font,
                        ),
                      ),
                    ],
                  ),
                ],
            ),
              ),
          ],
        ),
      ),
    );
  }
}