import 'package:flutter/material.dart';
import 'package:mood_tracker/database.dart';
import 'package:mood_tracker/moodEntry.dart';
import 'package:mood_tracker/moodEntryList.dart';
import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:clipboard/clipboard.dart';
import 'dart:convert';

import '../moodEntry.dart';

class SettingsPage extends StatefulWidget {
  //final Function refresh;
  final GlobalKey<ScaffoldState> scaffoldKey;
  SettingsPage({this.scaffoldKey});
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Future moodsFuture;
  final importController = TextEditingController();

  @override
  void initState() {
    super.initState();
    moodsFuture = getMoods();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    importController.dispose();
    super.dispose();
  }

  getMoods() async {
    final _moodsData = await DBProvider.db.getMood();
    return _moodsData;
  }

  Widget settingCard(Function onTap, String words) {
    return Container(
        margin: const EdgeInsets.fromLTRB(5, 0, 5, 10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1),
          ),
          elevation: 1,
          child: InkWell(
              onTap: () {
                onTap();
              },
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 5, 20),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: <Widget>[
                      Text(words,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Spacer(),
                      Icon(
                        Icons.chevron_right,
                        size: 20,
                      ),
                    ],
                  ))),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 30),
        settingCard(() {
          Navigator.pushNamed(context, '/cheatSheet');
        }, "Icon Cheat Sheet"),
        settingCard(() async {
          var table = await getMoods();
          if (table is List) {
            var toCopy = json.encode(table);
            print(toCopy);
            ClipboardManager.copyToClipBoard(toCopy).then((result) {
              final snackBar = SnackBar(
                content: Text('Copied to Clipboard'),
                action: SnackBarAction(
                  label: 'Close',
                  onPressed: () {},
                ),
              );
              Scaffold.of(context).showSnackBar(snackBar);
            });
          } else {
            print("No data yet!");
          }
        }, "Export Data"),
        settingCard(() {
          showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                //title: Text('Theme: System'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text("Warning, old data will be overridden"),
                      TextField(
                        controller: importController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Paste your Export Token here'),
                        minLines: 6,
                        maxLines: 6,
                      )
                    ],
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Clear'),
                    onPressed: () {
                      importController.text = "";
                    },
                  ),
                  FlatButton(
                    child: Text('Paste From Clipboard'),
                    onPressed: () {
                      FlutterClipboard.paste().then((value) {
                        // Do what ever you want with the value.
                        setState(() {
                          importController.text = value;
                        });
                      });
                    },
                  ),
                  FlatButton(
                    child: Text('Import Data'),
                    onPressed: () {
                      try {
                        final k = json.decode(importController.text);
                        MoodEntryList l = new MoodEntryList.fromJson(k);
                        List<MoodEntry> userEntries = l.entries;
                        userEntries.sort((a, b) => a.date.compareTo(b.date));
                        DBProvider.db.deleteTable();
                        userEntries.forEach((entry) => {
                              print(entry.why),
                              DBProvider.db.newMood(entry)
                              // DBProvider.db.deleteTable()
                            });
                        final snackBar = SnackBar(
                          content: Text('Data Imported'),
                          action: SnackBarAction(
                            label: 'Close',
                            onPressed: () {},
                          ),
                        );
                        Navigator.pop(context);
                        widget.scaffoldKey.currentState.showSnackBar(snackBar);
                        //print(l.entries[0].date);
                      } on Exception catch (_) {
                        print(_);
                        print("bruh");
                        final snackBar = SnackBar(
                          content: Text('Error: Invalid Token'),
                          action: SnackBarAction(
                            label: 'Close',
                            onPressed: () {},
                          ),
                        );
                        Navigator.pop(context);
                        widget.scaffoldKey.currentState.showSnackBar(snackBar);
                      }
                    },
                  ),
                ],
              );
            },
          );
        }, "Import Data"),
        settingCard(() {
          showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Delete All Data?'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text(
                          'Warning, this action cannot be undone. Are you really sure you want to delete all your data?'),
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
        }, "Reset Data"),
        settingCard(() {
          showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Theme: System'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text(
                          'This app automatically uses your system preferences to determine\nlight/dark mode.'),
                    ],
                  ),
                ),
              );
            },
          );
        }, "Theme: System"),
      ],
    );
  }
}
