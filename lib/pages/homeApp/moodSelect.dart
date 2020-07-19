import 'package:flutter/material.dart';
import '../../moodEntry.dart';
import 'package:mood_tracker/database.dart';

class MoodSelect extends StatefulWidget{
  
  MoodSelect();
  @override
  _MoodSelectState createState() => _MoodSelectState();

}

class _MoodSelectState extends State<MoodSelect> {
  double moodVal = 0;
  List<int> whyList = new List.filled(12, 0, growable: false); //0 = family, 1= friends, 2=work, 3=hobbies, 4=school,5=relationships,6=sleep,7=travelling,8=food,9=health,10music,11=relaxing
  Widget build(BuildContext context)
  {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SimpleDialog(
        title:Text("How are you feeling?"),
        children: <Widget>[
          Column(
            children:[
            Text('The number is'+moodVal.toString()),
            Slider(
              min:-5.0,
              max:5.0,
              value:moodVal,
              divisions:10,
              onChanged: (value) {
                setState(() {
                  moodVal = value;
                  print('changed, now moodVal is '+moodVal.toString());
                });
              },
            ),
            Wrap(
              direction: Axis.horizontal,
              spacing:10,
              children: [
                reasonSelect(context, "FAMILY", Icons.home,0),
                reasonSelect(context, "FRIENDS", Icons.people,1),
                reasonSelect(context, "WORK", Icons.home,2),
                reasonSelect(context, "HOBBIES", Icons.people,3),
                reasonSelect(context, "FAMILY", Icons.home,4),
                reasonSelect(context, "FRIENDS", Icons.people,5),
                reasonSelect(context, "WORK", Icons.home,6),
                reasonSelect(context, "HOBBIES", Icons.people,7),
                reasonSelect(context, "FAMILY", Icons.home,8),
                reasonSelect(context, "FRIENDS", Icons.people,9),
                reasonSelect(context, "WORK", Icons.home,10),
                reasonSelect(context, "HOBBIES", Icons.people,11),
              ],
            ),
            RaisedButton(
              onPressed: (){
                print(whyList);
                var m = MoodEntry(moodVal, whyList, DateTime.now());
                DBProvider.db.newMood(m);
                Navigator.pop(context);
                },
            ),
            RaisedButton(
              onPressed: (){
                DBProvider.db.deleteTable();
                Navigator.pop(context);
                },
            ),
          ])
        ],
      ),
    );
  }

  Widget reasonSelect(BuildContext context,String name, IconData icon,int whyIndex)
  {
    return GestureDetector(
        onTap: (){
          setState((){
            whyList[whyIndex] = whyList[whyIndex] == 0 ? 1 : 0;
          });
        },
        child: Container(
          decoration: BoxDecoration(
          color: whyList[whyIndex]==0 ? Colors.transparent: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          width:75.0,
          height:75.0,
          margin: EdgeInsets.all(3.0),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size:45,
                color:whyList[whyIndex]==0? Colors.black: Colors.white,),
              Text(
                name,
                style: TextStyle(color: whyList[whyIndex]==0? Colors.black: Colors.white,)
              )
            ]
          )
        )
    );
  }

}
