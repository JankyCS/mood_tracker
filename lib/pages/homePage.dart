import 'package:flutter/material.dart';
import 'package:mood_tracker/database.dart';

class HomePage extends StatefulWidget {
  final Function refresh;
  HomePage({@required this.refresh});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> moodList = [];

  Future moodsFuture;

  @override
  void initState() {
    super.initState();
    moodsFuture = getMoods();
  }

  getMoods() async {
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
              future: getMoods(),
              builder: (context, moodsData) {
                switch (moodsData.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                  case ConnectionState.active:
                  case ConnectionState.done:
                    var moodList = moodsData.data;
                    DateTime lastEntryDate = moodList != null && moodList != 123
                        ? DateTime.parse(moodList[moodList.length - 1]['date'])
                        : DateTime.now().subtract(Duration(days: 1));
                    DateTime now = DateTime.now();
                    int hour = now.hour;
                    String timeMsg = "";
                    String imgPath = "assets/images/sun.png";
                    String readyMsg = "Ready to talk about your feelings?";
                    if (hour >= 6 && hour < 12) {
                      timeMsg = "Good Morning!";
                      imgPath = "assets/images/sun.png";
                    } else if (hour >= 12 && hour < 17) {
                      timeMsg = "Good Afternoon!";
                      imgPath = "assets/images/sun.png";
                    } else {
                      timeMsg = "Good Evening!";
                      imgPath = "assets/images/moon.png";
                    }

                    Function onPress = () {
                      Navigator.pushNamed(context, '/ms2',
                          arguments: widget.refresh);
                    };

                    //Add this back to enable one entry per day
                    if (lastEntryDate.day == now.day &&
                        lastEntryDate.month == now.month &&
                        lastEntryDate.year == now.year) {
                      readyMsg = "Let's talk more tomorrow!";
                      onPress = null;
                      //return content;
                    }

                    Widget content = Column(
                      children: <Widget>[
                        Text(
                          timeMsg,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          //textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 15),
                        Image.asset(
                          imgPath,
                          height: 40,
                        ),
                        SizedBox(height: 15),
                        Text(
                          readyMsg,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 15),
                        RaisedButton(
                            child: Text("Add an Entry"), onPressed: onPress),
                      ],
                    );

                    return moodList != null ? content : Container();
                }
                return Container();
              })
        ],
      ),
    );
  }
}
