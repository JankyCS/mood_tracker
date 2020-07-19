import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:flutter/cupertino.dart';

class IconSheet extends StatefulWidget{
  IconSheet();
  @override
  _IconSheetState createState() => _IconSheetState();

}

class _IconSheetState extends State<IconSheet> {

  Widget reasonSelect(BuildContext context,String name, IconData icon,int whyIndex)
  {
    return InkWell(
      splashColor: Colors.purple,
        onTap: (){
          setState((){
          });
        },
        child: Container(
          decoration: BoxDecoration(
          color: true ? Colors.transparent: Colors.purple[300],
          ),
          margin: EdgeInsets.all(3.0),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size:(MediaQuery.of(context).size.width-60)/5-30,
                color:Theme.of(context).cardTheme.color,),
              Text(
                name,
                style: TextStyle(color: Theme.of(context).cardTheme.color,)
              )
            ]
          )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
   
    return 
    Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
                
                expandedHeight: 100,
                automaticallyImplyLeading: false, // removes back chevron
               
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
                Text(
                  'Icon Cheat Sheet',
                  style:TextStyle(
                    fontWeight: FontWeight.w500,
                    color: theme.cardTheme.color,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
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