import 'package:flutter/material.dart';
import 'package:mood_tracker/database.dart';
import 'package:mood_tracker/pages/history.dart';
import 'package:mood_tracker/pages/analytics.dart';
import 'package:mood_tracker/pages/homePage.dart';
import 'package:mood_tracker/pages/settings.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  _MyHomePageState myAppState=new _MyHomePageState();

  @override
  _MyHomePageState createState() => myAppState;

}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex=0;
   
  List<Map<String, dynamic>> moodList = [];
  Future moodsFuture;

  @override
  void initState() {
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
  
  Widget build(BuildContext context) {
    List<Widget> tabs =[
      HomePage(refresh: refresh,),
      AnalyticsPage(),
      HistoryPage(),
      SettingsPage()
  ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(00.0),
        child: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          //title: Text(widget.title),
          
          backgroundColor:  Colors.transparent,
          elevation: 0,
        ),
      ),
      body: SafeArea(top:false,child: tabs[_currentIndex]),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            title:Text('Home'),
            ),
          BottomNavigationBarItem(
            icon:Icon(Icons.grid_on),
            title:Text('Analytics'),
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.book),
            title:Text('History'),
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.settings),
            title:Text('Settings'),
            ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex=index;
          });
        },
      ),
    );
  }
}
