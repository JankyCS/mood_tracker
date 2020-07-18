import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:intl/intl.dart';

class HistoryCard extends StatelessWidget
{
  final Map<String, dynamic> moodMap;
  HistoryCard({@required this.moodMap});

  Widget reasonTile(IconData icon){
    return Container(
      decoration: BoxDecoration(
      color: true ? Colors.transparent: Colors.purple,
      border: Border.all(width: 2.0, color: Colors.purple),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      width:42.0,
      height:42.0,
      margin: EdgeInsets.all(2.0),
      //padding: const EdgeInsets.all(8.0),
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size:25,
            color:false? Colors.black: Colors.purple,
          ),
         
        ]
      )
    );
  }

 @override
  Widget build(BuildContext context) {
    double moodVal = moodMap['mood'];
    String img = "";
    String phrase = "";

    List<int> reasonList =[
      moodMap['r0'],
      moodMap['r1'],
      moodMap['r2'],
      moodMap['r3'],
      moodMap['r4'],
      moodMap['r5'],
      moodMap['r6'],
      moodMap['r7'],
      moodMap['r8'],
      moodMap['r9'],
      moodMap['r10'],
      moodMap['r11'],
    ];
    var list = [for(var i=0; i<12; i+=1) i];

    List<Widget> reasonTiles = [
      reasonTile(OMIcons.home),
      reasonTile(OMIcons.peopleOutline),
      reasonTile(Icons.business),
      reasonTile(Icons.gesture),
      reasonTile(OMIcons.school),
      reasonTile(OMIcons.favoriteBorder),
      reasonTile(Icons.healing),
      reasonTile(OMIcons.headset),
      reasonTile(OMIcons.kitchen),
      reasonTile(OMIcons.announcement),
      reasonTile(OMIcons.wbSunny),
      reasonTile(OMIcons.localAtm),
    ];


    if(moodVal>=3) {
      img = "assets/images/emotion4.png";
      phrase = "Super Great";
    }
    else if (moodVal>=1){
      img = "assets/images/emotion3.png";
      phrase = "Pretty Swell";
    }
    else if (moodVal>=-1){
      img =  "assets/images/emotion2.png";
      phrase = "Completely Fine";
    }
    else if (moodVal >=-3){
      img = "assets/images/emotion1.png";
      phrase = "Somewhat Bad";
    }
    else{
      img = "assets/images/emotion0.png";
      phrase = "Totally Terrible";
    }


    return Container(
        margin: const EdgeInsets.fromLTRB(20,0,20,10),
        // decoration: BoxDecoration(
        //   border: Border(
        //     //top: BorderSide(width: 16.0, color: Colors.lightBlue.shade50),
        //     bottom: BorderSide(width: 1.0, color: Color(0xffEFEFEF)),
        //   ),
        // ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
          child: Padding(
          padding: EdgeInsets.fromLTRB(10,15,10,15),
          child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    //
                  Column(
                    children: <Widget>[
                      Image.asset(
                        img,
                        height: 50
                      ),
                      // SizedBox(height:10),
                      //Text("Super Great")
                    ],
                  ),
                 

                    //
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
                          //"JULY 10, 2020",
                          DateFormat('MMMM d, yyyy').format(DateTime.parse(moodMap['date'])).toUpperCase()+"",
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
                          ///"FELT GREAT!",
                          ""+phrase,
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
                   
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,0,10,0),
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                // Text(
                //   "Here's Why:",
                //   style: TextStyle(
                //     fontWeight: FontWeight.w700,
                //     color: Colors.black,
                //     fontSize: 18,
                //   ),
                // ),
                Wrap(
                  children: [
                    for(int i in list) 
                      if(reasonList[i]==1) reasonTiles[i]
                  ]//reasonList != null ? reasonList.map((int i) => reasonTiles[i]).toList(): []
                )
                
              ],
            ),
          ),
        ),
    );
  }
}