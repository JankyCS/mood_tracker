import 'package:flutter/material.dart';
import 'moodSelect.dart';
import '../../moodEntry.dart';
import 'package:mood_tracker/database.dart';
import 'package:intl/intl.dart';
import 'package:mood_tracker/pages/history.dart';
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
    print("peepo");
    final _moodsData = await DBProvider.db.getMood();
    return _moodsData;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs =[
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Home'),
            if(true)
              RaisedButton( 
                onPressed: () => 
                Navigator.pushNamed(context, '/ms2')
                // showDialog(
                // context: context,
                // builder: (context){
                //     return MoodSelect();
                // },
                // )
              )
          ],
        ),
      ),
      Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Analytics'),
          ],
        ),
      ),
      HistoryPage(),
      
      Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You'),
          ],
        ),
      )
  ];

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        backgroundColor: Colors.white,
      ),
      body: tabs[_currentIndex],
 
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
            icon:Icon(Icons.person),
            title:Text('You'),
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
