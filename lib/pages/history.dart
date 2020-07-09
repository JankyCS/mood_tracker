import 'package:flutter/material.dart';
import 'package:mood_tracker/database.dart';
import 'package:intl/intl.dart';
import 'package:outline_material_icons/outline_material_icons.dart';


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
    print("peepo");
    final _moodsData = await DBProvider.db.getMood();
    return _moodsData;
  }

  @override
  Widget build(BuildContext context) {
    return Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            FutureBuilder(
              future:getMoods(),  //Note, chaneg to moodsFuture later, after implementing refresh when new mood added
              builder: (context, moodsData) {

                switch (moodsData.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                  case ConnectionState.active:
                  case ConnectionState.done:
                    //moodsFuture = getMoods();
                    moodList = moodsData.data;
                    print("got here");
                    //print(moodList[0].toString());
                    if(moodList != null)
                    {
                      return Column(
                      children: <Widget>[
                        Text(
                          moodList.toString()
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 0.0),
                          decoration: BoxDecoration(
                            border: Border(
                              //top: BorderSide(width: 16.0, color: Colors.lightBlue.shade50),
                              bottom: BorderSide(width: 1.0, color: Color(0xffEFEFEF)),
                            ),
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            elevation: 0,
                            child: InkWell(
                              onTap: (){
                                print("Tapped");
                              },
                              child: Padding(
                              padding: EdgeInsets.fromLTRB(10,15,10,15),
                              child: 
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      
                                      children: <Widget>[
                                        Image(
                                          height:50,
                                            image: NetworkImage("https://cdn.shopify.com/s/files/1/1061/1924/products/Smiling_Emoji_with_Eyes_Opened_large.png?v=1571606036"),
                                        ),
                                        SizedBox(
                                          width:20,
                                          
                                        ),
                                        //Spacer(),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "JULY 10, 2020",
                                              //DateFormat('MMMM d, yyyy').format(DateTime.parse(moodList[0]['date'])).toUpperCase()+":",
                                              style:
                                                TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.black,
                                                  fontSize: 24,
                                                ),
                                                textAlign: TextAlign.start,
                                            ),
                                            Text(
                                              //"pog",
                                              "FELT GREAT!",
                                              style:
                                                TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                  fontSize: 24,
                                                ),
                                                textAlign: TextAlign.start,
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                       
                                        //SizedBox(width:20),
                                        Icon(
                                          Icons.chevron_right,
                                          color: Color.fromRGBO(155, 155, 155, 1)
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                                      child: Divider(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "Here's Why:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                      )
                      ],
                    ); 
                    }
                    
                }

                return Column(
                  children: <Widget>[
                    Text("nog")
                  ],
                );
              },
            ),


            Text('History'),
            //////////
            
            //////////
          ],
        ),
      );
  }
}