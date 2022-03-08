
import 'package:flutter/material.dart';

class AlarmInfo {
  DateTime alarmDataTime;
  String description;
  bool isActive = true;
  List<Color> gradientColors;

  AlarmInfo(this.alarmDataTime,  {required this.description, required this.gradientColors} );
}