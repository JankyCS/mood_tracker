import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class MoodPerReason {
  MoodPerReason ({@required this.reason, @required this.moodSum, @required Color color}):
    this.color = new charts.Color(r: color.red, g: color.green, b: color.blue, a: color.alpha);

  final String reason;
  double moodSum;
  final charts.Color color;

  void add(double d)
  {
    this.moodSum += d;
  }
}
