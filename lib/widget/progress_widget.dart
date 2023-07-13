import 'package:flutter/material.dart';

import '../model/current_data.dart';

class ShowProgressWidget extends StatelessWidget {
  const ShowProgressWidget({
    super.key,
    required this.data,
  });

  final CurrentData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: data.is_day == 1 ? Colors.white.withOpacity(0.7) : Colors.black.withOpacity(0.7),
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: CircularProgressIndicator(
          color: data.font_color,
        ),
      ),
    );
  }
}