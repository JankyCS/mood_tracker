import 'package:flutter/material.dart';
import 'package:mood_tracker/database.dart';
import 'package:intl/intl.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
//import '../../moodEntry.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class IconSheet extends StatefulWidget{
  //final Function refresh;
  IconSheet();
  @override
  _IconSheetState createState() => _IconSheetState();

}

class _IconSheetState extends State<IconSheet> {
  
  //List<int> whyList = new List.filled(12, 0, growable: false); //0 = family, 1= friends, 2=work, 3=hobbies, 4=school,5=relationships,6=sleep,7=travelling,8=food,9=health,10music,11=relaxing
  double moodVal = 0;


  Widget reasonSelect(BuildContext context,String name, IconData icon,int whyIndex)
  {
    return InkWell(
      splashColor: Colors.purple,
        onTap: (){
          setState((){
            //whyList[whyIndex] = whyList[whyIndex] == 0 ? 1 : 0;
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
                color:true? Theme.of(context).cardTheme.color: Colors.white,),
              Text(
                name,
                style: TextStyle(color: true ? Theme.of(context).cardTheme.color: Colors.white,)
              )
            ]
          )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool editing = false;
    const sectionTitleStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: Color.fromARGB(255, 3, 3, 3),
    );

    final bigTitleStyle = theme.primaryTextTheme.headline5.copyWith(
        fontWeight: FontWeight.bold,
      );


    return 
    Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
                
                expandedHeight: 100,
                automaticallyImplyLeading: false, // removes back chevron
                //pinned: false,
             
                // bottom: 
                // PreferredSize(
                //   preferredSize: Size.fromHeight(20.0), // adds space to the bottom of the appbar
                //   child: Container(
                //     //child: Text("Test")
                //   ),
                // ),
                backgroundColor: Colors.purple,
                leading: IconButton(
                    icon: Icon(Icons.chevron_left),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    iconSize: 30,
                  ),
                
                
                excludeHeaderSemantics: false,
                flexibleSpace: FlexibleSpaceBar(
                  
                  background: Container(
                    //height: 279,
                    child: Stack(
                      alignment: Alignment.center,
                      fit: StackFit.expand,
                      children: <Widget>[
                        DecoratedBox(
                          decoration: BoxDecoration(

                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.center,
                              colors: <Color>[
                                Color(0xFF202020),
                                Color(0xFF383838),
                              ],
                            ),
                          ),
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                      
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.center,
                              colors: <Color>[
                                Color(0xB2000000),
                                Color(0x00000000),
                              ],
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/images/background.jpg',
                          height:2,
                          fit: BoxFit.cover,
                          color:Colors.purpleAccent[100],
                          colorBlendMode: BlendMode.multiply,
                        ),
                        
                        
                      ],
                    ),
                  ),
                  
                  
                ),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(30,20,30,30),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                //SizedBox(height: 18),
                
                


                Text(
                  'Icon Cheat Sheet',
                  style:TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).cardTheme.color,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                //SizedBox(height:10),
                //Text(moodVal.toString()),
                
              ]
              )
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(30,0,30,30),
              sliver: SliverGrid.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: <Widget>[
                    reasonSelect(context, "family", OMIcons.home,0),
                    reasonSelect(context, "friends", OMIcons.peopleOutline,1),
                    reasonSelect(context, "work", Icons.business,2),
                    reasonSelect(context, "hobbies", Icons.gesture,3),
                    reasonSelect(context, "school", OMIcons.school,4),
                    reasonSelect(context, "love", Icons.favorite_border,5),
                    reasonSelect(context, "health", Icons.healing,6),
                    reasonSelect(context, "music", OMIcons.headset,7),
                    reasonSelect(context, "food", OMIcons.kitchen,8),
                    reasonSelect(context, "news", OMIcons.announcement,9),
                    reasonSelect(context, "weather", OMIcons.wbSunny,10),
                    reasonSelect(context, "money", OMIcons.localAtm,11),
                  ],
              ),
              
            ),
            
            
          ],
        ),
      );
    
    
  }
}