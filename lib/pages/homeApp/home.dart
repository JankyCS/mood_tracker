import 'package:flutter/material.dart';
import 'moodSelect.dart';
import '../../moodEntry.dart';
import 'package:mood_tracker/database.dart';
import 'package:intl/intl.dart';

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
                              padding: EdgeInsets.fromLTRB(0,15,10,15),
                              child: 
                                Row(
                                  children: <Widget>[
                                    // Image(
                                    //   height:50,
                                    //     //image: NetworkImage("imgURL"),
                                    // ),
                                    SizedBox(
                                      width:35,
                                      
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          //"pog",
                                          DateFormat('MMMM d, yyyy').format(DateTime.parse(moodList[0]['date'])),
                                          style:
                                            TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                              fontSize: 18,
                                            ),
                                            textAlign: TextAlign.start,
                                        ),
                                        SizedBox(
                                          //width:35,
                                          height:10
                                        ),
                                        Text("formattedDate"),
                                      ],
                                    ),
                                    Spacer(),
                                    Row(
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Text(
                                              "formattedPrice",
                                              style:
                                                TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                ),
                                                textAlign: TextAlign.start,
                                            ),
                                            SizedBox(
                                              //width:35,
                                              height:10
                                            ),
                                            Text("formattedCurrency"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(width:20),
                                    Icon(
                                      Icons.chevron_right,
                                      color: Color.fromRGBO(155, 155, 155, 1)
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
