import 'package:flutter/material.dart';

Color day_color = Color(0xff74d5fd);
Color night_color = Colors.black54;

Color dark_font = Colors.black87;
Color light_font = Colors.white;

Color night_col1 = Color(0xff423253);
Color night_col2 = Color(0xff1A1423).withOpacity(0.5);

Color tile_dark1 = Color(0xff241D2C);
Color tile_dark2 = Color(0xff362A3B).withOpacity(0.5);

Color tile_dark_sel1 = Color(0xffCE9BAE);
Color tile_dark_sel2 = Color(0xffCE9BAE).withOpacity(0.5);

Color day_col1 = Color(0xff74d5fd);
Color day_col2 = Color(0xffe5ecf9).withOpacity(0.5);

Color tile_light1 = Color(0xff241D2C);
Color tile_light2 = Color(0xff362A3B).withOpacity(0.5);

int xx = 113;

BoxDecoration containerDec =  BoxDecoration(
  color: Colors.transparent,
  borderRadius: BorderRadius.circular(32),
  boxShadow: [
  BoxShadow(
    color: Colors.black.withOpacity(0.05),
    offset: Offset(-7,-3),
    blurRadius: 5,
    ),
    BoxShadow(
    color: Colors.white.withOpacity(0.1),
    offset: Offset(0,0),
    blurRadius: 8,
    spreadRadius: 1
    ),
  ],
);

Divider divider = Divider(
  thickness: 2,
  color: Colors.white12,
  indent: 10,
  endIndent: 10,
  height: 20,
);

const kTextFieldDec = InputDecoration(
    filled: true,
    icon: Icon(
      Icons.location_city_outlined,
      color: Colors.white,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8.0),
      ),
      borderSide: BorderSide.none,
    ),
    hintText: "City Name",
    hintStyle: TextStyle(
      color: Colors.grey,
    )
);
