import 'package:flutter/material.dart';
import 'package:weatherly/model/current_data.dart';

class LocationButton extends StatelessWidget {
  LocationButton({
    super.key,
    required this.data,
    required this.onPressed,
  });

  final CurrentData data;
  var onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: MaterialButton(
        onPressed: onPressed,
        child: Icon(
          Icons.my_location_outlined,
          size: 30.0,
          color: data.font_color,
        ),
      ),
    );
  }
}