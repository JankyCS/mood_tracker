import 'package:flutter/material.dart';
import 'package:mood_tracker/database.dart';
import 'package:intl/intl.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:mood_tracker/historyCard.dart';

class SettingsPage extends StatefulWidget{
  //final Function refresh;
  SettingsPage();
  @override
  _SettingsPageState createState() => _SettingsPageState();

}

class _SettingsPageState extends State<SettingsPage> {
 
  Widget settingCard(Function onTap, String words)
  {
    return Container(
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
            onTap();
          },
          child: Container(
            padding:EdgeInsets.fromLTRB(20,20,5,20),
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: <Widget>[
                Text(words,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  )
                ),
                Spacer(),
                Icon(
                Icons.chevron_right,
                size:20,
                //color:Colors.black
                ),
              ],
            )
          )
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: ,
        children: <Widget>[
          SizedBox(height:30),
          settingCard((){Navigator.pushNamed(context, '/cheatSheet');}, "Icon Cheat Sheet"),
          settingCard(
            (){
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
                  );
                },
              );
            },
            "Import/Export Data"
          ),
          settingCard(
            (){
              showDialog<void>(
                context: context,
                barrierDismissible: true, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Delete All Data?'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text('Warning, this action cannot be undone. Are you really sure you want to delete all your data?'),
                          //Text('Stay Tuned :)'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Cancel'),
                        onPressed: () {
                        Navigator.pop(context);
                        },
                      ),
                      FlatButton(
                        child: Text('Yes, let\'s get a clean slate!'),
                        onPressed: () {
                          DBProvider.db.deleteTable();
                        
                          Navigator.pop(context);
                        },
                      ),
                      
                    ],
                  );
                },
              );
              
              
            },
            "Reset Data"
          ),
          settingCard(
            (){
              showDialog<void>(
                context: context,
                barrierDismissible: true, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Theme: System'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text('This app automatically uses your system preferences to determine\nlight/dark mode.'),
                          //Text('Stay Tuned :)'),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            "Theme: System"
          ),
          

          
        ],
      );
  }
}