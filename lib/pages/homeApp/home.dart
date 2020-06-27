import 'package:flutter/material.dart';
import 'moodSelect.dart';
import '../../moodEntry.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex=0;


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
                onPressed: () => showDialog(
                context: context,
                builder: (context){
                    return MoodSelect();
                },
                )
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
      Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('History'),
          ],
        ),
      ),
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
