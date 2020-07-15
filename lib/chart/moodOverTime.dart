import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class MoodOverTime {
  MoodOverTime ({@required this.date, @required this.moodVal});
    //this.color = new charts.Color(r: color.red, g: color.green, b: color.blue, a: color.alpha);

  final DateTime date;
  final double moodVal;
  //final charts.Color color;

  // void add(double d)
  // {
  //   this.moodSum += d;
  // }
}
