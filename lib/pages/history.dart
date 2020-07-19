import 'package:flutter/material.dart';
import 'package:mood_tracker/database.dart';
import 'package:intl/intl.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:mood_tracker/historyCard.dart';

class HistoryPage extends StatefulWidget{
  
  HistoryPage();
  @override
  _HistoryPageState createState() => _HistoryPageState();

}

class _HistoryPageState extends State<HistoryPage> {
  
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

  @override
  Widget build(BuildContext context) {
    return Center( 
        child: FutureBuilder(
          future:moodsFuture,  //Note, chaneg to moodsFuture later, after implementing refresh when new mood added
          builder: (context, moodsData) {

            switch (moodsData.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
              case ConnectionState.done:
                //moodsFuture = getMoods();
                if(moodsData.data is List)
                {
                  moodList = moodsData.data;
                }
                
               // print("got here");
                //print(moodList[0].toString());
                if(moodList.length!=0)//moodList != null
                {
                  return ListView(
                  children: <Widget>[
                    // Text(
                    //   moodList.toString()
                    // ),
                    SizedBox(height:20),
                    Column(
                      children: moodList.reversed.map((Map<String, dynamic> m) => new HistoryCard(moodMap: m,)).toList()
                    ),
                    
                    //HistoryCard(),
                    //HistoryCard()
                  ],
                ); 
                }
                if(moodsData.data==123)
                {
                  return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "You haven't made any entries yet!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  
                  ],
                );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              
              ],
            );
          },
        ),
      );
  }
}