import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:mood_tracker/database.dart';
import 'package:intl/intl.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:mood_tracker/historyCard.dart';
import 'package:mood_tracker/chart/moodPerReason.dart';


class AnalyticsPage extends StatefulWidget{
  
  AnalyticsPage();
  @override
  _AnalyticsPageState createState() => _AnalyticsPageState();

}

class _AnalyticsPageState extends State<AnalyticsPage> {
  
  List<Map<String, dynamic>> moodList = [];

  Future moodsFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moodsFuture = getMoods();
  }

  getMoods() async {
    //print("peepo");
    final _moodsData = await DBProvider.db.getMood();
    return _moodsData;
  }

  Widget reasonTile(IconData icon){
    return Container(
      decoration: BoxDecoration(
      color: true ? Colors.transparent: Colors.purple,
      border: Border.all(width: 2.0, color: Colors.purple),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      width:(MediaQuery.of(context).size.width-41)/12-2,
      height:(MediaQuery.of(context).size.width-41)/12-2,
      margin: EdgeInsets.all(1),
      //padding: const EdgeInsets.all(8.0),
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size:(MediaQuery.of(context).size.width)/12-13,
            color:false? Colors.black: Colors.purple,
          ),
         
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    var dataGood = [
      MoodPerReason(
        reason:'Family',
        moodSum: 13,
        color:Colors.purple[300]
      ),
      MoodPerReason(
        reason:'Amily',
        moodSum: 4,
        color:Colors.purple[300]
      ),
      MoodPerReason(
        reason:'camily',
        moodSum: 10,
        color:Colors.purple[300]
      ),
      MoodPerReason(
        reason:'dmily',
        moodSum: 10,
        color:Colors.purple[300]
      ),
      //
      //
      MoodPerReason(
        reason:'qamily',
        moodSum: 10,
        color:Colors.purple[100]
      ),
      MoodPerReason(
        reason:'wmily',
        moodSum: 7,
        color:Colors.purple[100]
      ),
       MoodPerReason(
        reason:'eamily',
        moodSum: 10,
        color:Colors.purple[100]
      ),
      MoodPerReason(
        reason:'emily',
        moodSum: 7,
        color:Colors.purple[100]
      ),
      //
      MoodPerReason(
        reason:'tamily',
        moodSum: 10,
        color:Colors.purple[100]
      ),
      MoodPerReason(
        reason:'ymily',
        moodSum: 7,
        color:Colors.purple[100]
      ),
       MoodPerReason(
        reason:'uamily',
        moodSum: 10,
        color:Colors.purple[100]
      ),
      MoodPerReason(
        reason:'imily',
        moodSum: 7,
        color:Colors.purple[100]
      ),
    ];

    var dataBad = [
      MoodPerReason(
        reason:'Family',
        moodSum: 10,
        color:Colors.purple[100]
      ),
      MoodPerReason(
        reason:'Amily',
        moodSum: 7,
        color:Colors.purple[100]
      ),
       MoodPerReason(
        reason:'camily',
        moodSum: 10,
        color:Colors.purple[100]
      ),
      MoodPerReason(
        reason:'dmily',
        moodSum: 7,
        color:Colors.purple[100]
      ),
      //
      MoodPerReason(
        reason:'qamily',
        moodSum: 10,
        color:Colors.purple[100]
      ),
      MoodPerReason(
        reason:'wmily',
        moodSum: 7,
        color:Colors.purple[100]
      ),
       MoodPerReason(
        reason:'eamily',
        moodSum: 10,
        color:Colors.purple[100]
      ),
      MoodPerReason(
        reason:'emily',
        moodSum: 7,
        color:Colors.purple[100]
      ),
      //
      MoodPerReason(
        reason:'tamily',
        moodSum: 10,
        color:Colors.purple[100]
      ),
      MoodPerReason(
        reason:'ymily',
        moodSum: 7,
        color:Colors.purple[100]
      ),
       MoodPerReason(
        reason:'uamily',
        moodSum: 10,
        color:Colors.purple[100]
      ),
      MoodPerReason(
        reason:'imily',
        moodSum: 7,
        color:Colors.purple[100]
      ),

    ];

    var series1 = [
      charts.Series(
        id: 'Happiness',
        domainFn: (MoodPerReason entry, _) => entry.reason,
        measureFn: (MoodPerReason entry, _) => entry.moodSum,
        colorFn: (MoodPerReason entry, _) => entry.color,
        data: dataGood,
        labelAccessorFn: (MoodPerReason entry, _) =>'${entry.reason}: \$${entry.moodSum}'
      )
    ];

    var series2 = [
      charts.Series(
        id: 'Sadness',
        domainFn: (MoodPerReason entry, _) => entry.reason,
        measureFn: (MoodPerReason entry, _) => entry.moodSum,
        colorFn: (MoodPerReason entry, _) => entry.color,
        data: dataBad,
        labelAccessorFn: (MoodPerReason entry, _) =>'${entry.reason}: \$${entry.moodSum}'
      )
    ];



    return Center(
      child: Container(
        height:MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            RichText(
              textAlign: TextAlign.left,
              text: new TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 24,
                ),
                children: <TextSpan>[
                  new TextSpan(text: 'This week, the thing that made you happiest was:'),
                  new TextSpan(text: '\nHOBBIES', style: new TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height:10),
            Divider(
              color: Colors.black,
            ),
            SizedBox(height:10),
            RichText(
              textAlign: TextAlign.left,
              text: new TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 24,
                ),
                children: <TextSpan>[
                  new TextSpan(text: 'This week, the thing that made you saddest was:'),
                  new TextSpan(text: '\nHOBBIES', style: new TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
             SizedBox(height:10),
            Divider(
              color: Colors.black,
            ),
            SizedBox(height:10),
            Container(
              //height:100, 
              //width:100,
              //padding: const EdgeInsets.fromLTRB(50,20,50,20),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height:120, 
                    //width:100,
                    child: AbsorbPointer(
                        absorbing: true,
                        child: charts.BarChart(
                        series1+series2,
                        animate: false,
                        vertical: true,
                        defaultInteractions: false,
                        behaviors: [new charts.SeriesLegend()],
                        barGroupingType: charts.BarGroupingType.grouped,//barGroupingType: charts.BarGroupingType.stacked,
                        // Set a bar label decorator.
                        // Example configuring different styles for inside/outside:
                        //       barRendererDecorator: new charts.BarLabelDecorator(
                        //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
                        //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
                        //barRendererDecorator: new charts.BarLabelDecorator<String>(),
                          primaryMeasureAxis:
                         new charts.NumericAxisSpec(renderSpec: new charts.NoneRenderSpec()),

                      //
                      domainAxis: new charts.OrdinalAxisSpec(
                          // Make sure that we draw the domain axis line.
                          showAxisLine: true,
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
                    ),
                  ),
                  SizedBox(height:3),
                  Container(
                    height:80,
                    child: Wrap(
                      // Create a grid with 2 columns. If you change the scrollDirection to
                      // horizontal, this produces 2 rows.
                      //crossAxisCount: 12,
                      // Generate 100 widgets that display their index in the List.
                      children: [
                        reasonTile(OMIcons.home),
                        reasonTile(OMIcons.peopleOutline),
                        reasonTile(Icons.business),
                        reasonTile(Icons.gesture),
                        reasonTile(OMIcons.school),
                        reasonTile(OMIcons.favoriteBorder),
                        reasonTile(Icons.healing),
                        reasonTile(OMIcons.headset),
                        reasonTile(OMIcons.kitchen),
                        reasonTile(OMIcons.announcement),
                        reasonTile(OMIcons.wbSunny),
                        reasonTile(OMIcons.localAtm),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
