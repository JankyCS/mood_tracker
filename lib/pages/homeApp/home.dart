import 'package:flutter/material.dart';
import 'moodSelect.dart';
import '../../moodEntry.dart';
import 'package:mood_tracker/database.dart';
import 'package:intl/intl.dart';
import 'package:mood_tracker/pages/history.dart';
import 'package:mood_tracker/pages/analytics.dart';
import 'package:intl/intl.dart';
import 'package:outline_material_icons/outline_material_icons.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  _MyHomePageState myAppState=new _MyHomePageState();

  @override
  _MyHomePageState createState() => myAppState;
  // getMoods() async{
  //   return myAppState.getMoods();
  // }

}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex=0;
   
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

  refresh() {
    setState(() {
      _currentIndex=2;
    });
  }
  Widget reasonSelect(BuildContext context,String name, IconData icon,int whyIndex)
    {
      return InkWell(
        splashColor: Colors.purple,
          onTap: (){
            setState((){
              // whyList[whyIndex] = whyList[whyIndex] == 0 ? 1 : 0;
            });
          },
          child: Container(
            decoration: BoxDecoration(
            color: true ? Colors.transparent: Colors.purple[300],
              //borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          // width:75.0,
            //height:75.0,
            margin: EdgeInsets.all(3.0),
            //padding: const EdgeInsets.all(8.0),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size:(MediaQuery.of(context).size.width-60)/5-30,
                  color: true? Colors.black: Colors.white,),
                Text(
                  name,
                  style: TextStyle(color: true ? Colors.black: Colors.white,)
                )
              ]
            )
          )
      );
    }
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs =[
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder(
              future:getMoods(),
              builder:(context,moodsData)
              {
                switch (moodsData.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                  case ConnectionState.active:
                  case ConnectionState.done:
                    
                    var moodList = moodsData.data;
                    DateTime lastEntryDate = moodList != null && moodList!=123? DateTime.parse(moodList[moodList.length-1]['date']) : DateTime.now().subtract(Duration(days:1));
                    DateTime now = DateTime.now();
                    int hour = now.hour;
                    String timeMsg="";
                    String imgPath="assets/images/sun.png";
                    String readyMsg="Ready to talk about your feelings?";
                    if(hour >= 6 && hour<12)
                    {
                      timeMsg = "Good Morning!";
                      imgPath="assets/images/sun.png";
                    }
                    else if(hour >= 12 && hour< 17)
                    {
                      timeMsg = "Good Afternoon!";
                      imgPath="assets/images/sun.png";
                    }
                    else
                    {
                      timeMsg = "Good Evening!";
                      imgPath="assets/images/moon.png";
                    }
                    

                    Function onPress = (){
                      Navigator.pushNamed(context, '/ms2', arguments: refresh);
                    };

                    if(
                      lastEntryDate.day == now.day &&
                      lastEntryDate.month == now.month &&
                      lastEntryDate.year == now.year
                    )
                    {
                      readyMsg="Let's talk more tomorrow!";
                      onPress = null;
                      //return content;
                    }
                  
                    Widget content = Column(
                      children: <Widget>[
                        Text(timeMsg,
                          style: TextStyle(
                            color:Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                          //textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height:15
                        ),
                        Image.asset(
                          imgPath,
                          height:40,
                        ),
                        SizedBox(
                          height:15
                        ),
                        Text(
                          readyMsg,
                          style: TextStyle(
                            color:Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height:15
                        ),
                        RaisedButton(
                          child: Text("Add an Entry"),
                          onPressed: onPress
                        ),
                      ],
                    );

                    return moodList != null ? content : Container();
                  
                }
              }
            )
            // Text('Home'),
            // if(true)
            //   RaisedButton(
            //     child: Text("Add an Entry"),
            //     onPressed: () => 
            //     Navigator.pushNamed(context, '/ms2')
            //   )
          ],
        ),
      ),
      AnalyticsPage(),
      HistoryPage(),
      
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: ,
        children: <Widget>[
          SizedBox(height:30),
          Container(
            margin: const EdgeInsets.fromLTRB(5,0,5,10),
            // decoration: BoxDecoration(
            //   border: Border(
            //     //top: BorderSide(width: 16.0, color: Colors.lightBlue.shade50),
            //     bottom: BorderSide(width: 1.0, color: Color(0xffEFEFEF)),
            //   ),
            // ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1),
              ),
              elevation: 1,
              child: InkWell(
                onTap: (){
                  Navigator.pushNamed(context, '/cheatSheet');
                },
                child: Container(
                  padding:EdgeInsets.fromLTRB(20,20,5,20),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: <Widget>[
                      Text("Icon Cheat Sheet",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      Spacer(),
                      Icon(
                      Icons.chevron_right,
                      size:20,
                      color:Colors.black
                      ),
                    ],
                  )
                )
              ),
            )
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(5,0,5,10),
            // decoration: BoxDecoration(
            //   border: Border(
            //     //top: BorderSide(width: 16.0, color: Colors.lightBlue.shade50),
            //     bottom: BorderSide(width: 1.0, color: Color(0xffEFEFEF)),
            //   ),
            // ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1),
              ),
              elevation: 1,
              child: InkWell(
                onTap: (){
                  showDialog<void>(
                  context: context,
                  barrierDismissible: true, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Stay Tuned!'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text('This feature will be implemented in a future update!'),
                            //Text('Stay Tuned :)'),
                          ],
                        ),
                      ),
                      // actions: <Widget>[
                      //   FlatButton(
                      //     child: Text('OK'),
                      //     onPressed: () {
                      //       Navigator.of(context).pop();
                      //     },
                      //   ),
                      // ],
                    );
                  },
                );
                },
                child: Container(
                  padding:EdgeInsets.fromLTRB(20,20,5,20),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: <Widget>[
                      Text("Import/Export Data",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      Spacer(),
                      Icon(
                      Icons.chevron_right,
                      size:20,
                      color:Colors.black
                      ),
                    ],
                  )
                )
              ),
            )
          ),
          
          
        ],
      )
  ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(00.0),
        child: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          //title: Text(widget.title),
          
          backgroundColor:  Color.fromRGBO(249, 249, 249, 1.0),
          elevation: 0,
        ),
      ),
      body: SafeArea(top:false,child: tabs[_currentIndex]),
 
      // floatingActionButton: FancyButton(
      //   //onPressedMethod: _incrementCounter,
      //   onPressedMethod: () => showDialog(
      //     context: context,
      //     builder: (context){
      //         return MoodSelect(onPressedMethod:addMood);
      //     },
      //   ),
      //   //tooltip: 'Increment',
      //   //child: Icon(Icons.add),
      // ), 
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            title:Text('Home'),
            //backgroundColor: Colors.blue[500]
            ),
          BottomNavigationBarItem(
            icon:Icon(Icons.grid_on),
            title:Text('Analytics'),
            //backgroundColor: Colors.blue[501]
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.book),
            title:Text('History'),
           // backgroundColor: Colors.orange
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.settings),
            title:Text('Settings'),
            //backgroundColor: Colors.purple
            ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex=index;
          });
        },
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
