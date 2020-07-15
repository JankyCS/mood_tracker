import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Graph extends StatelessWidget{

  final series;
  final int scale;
  final bool pos;
  Graph({@required this.series, @required this.scale, @required this.pos});

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: true,
      child: charts.BarChart(
      
      series,
      animate: true,
      vertical: false,
      defaultInteractions: false,
      //behaviors: [new charts.SeriesLegend()],
      //barGroupingType: charts.BarGroupingType.grouped,//barGroupingType: charts.BarGroupingType.stacked,
      // Set a bar label decorator.
      // Example configuring different styles for inside/outside:
      //       barRendererDecorator: new charts.BarLabelDecorator(
      //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
      //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
      //barRendererDecorator: new charts.BarLabelDecorator<String>(),
      primaryMeasureAxis:
      new charts.NumericAxisSpec(
        showAxisLine: false,
        renderSpec: new charts.NoneRenderSpec(),
        viewport: pos ? charts.NumericExtents(0, scale) : charts.NumericExtents(scale*-1, 0),
      ),

    // //
      domainAxis: new charts.OrdinalAxisSpec(
        // Make sure that we draw the domain axis line.
        showAxisLine: false,
        
        // But don't draw anything else.
        renderSpec: new charts.NoneRenderSpec()),
      // 1px is the smallest we can make each margin.
      //Remove Y axis
      layoutConfig: new charts.LayoutConfig(
        leftMarginSpec: new charts.MarginSpec.fixedPixel(0),
        topMarginSpec: new charts.MarginSpec.fixedPixel(0),
        rightMarginSpec: new charts.MarginSpec.fixedPixel(0),
        bottomMarginSpec: new charts.MarginSpec.fixedPixel(0)),
      

  ),
  );
  }
}