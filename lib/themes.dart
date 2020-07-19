import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Themes {
  static final Color mainBlack = Colors.black;
  static final Color mainWhite = Colors.white;
  static final Color mainGrey = Color.fromRGBO(155, 155, 155, 1);
  static final Color offWhite = Color.fromRGBO(249, 249, 249, 1.0);

  static final LIGHT = ThemeData(
    canvasColor: offWhite,
    primaryColor: Colors.purple,
    accentColor: Colors.purple,
    textTheme: TextTheme(
      button: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
      
    ),
    appBarTheme: AppBarTheme(
      elevation: 1,
      brightness: Brightness.light,
      textTheme: TextTheme(
        headline6: TextStyle(color: mainBlack),
        button: TextStyle(color: mainBlack),
      ),
      iconTheme: IconThemeData(color: mainBlack),
      actionsIconTheme: IconThemeData(color: mainBlack),
    ),
    buttonTheme: ButtonThemeData(
      splashColor: offWhite.withOpacity(0.2),
      textTheme: ButtonTextTheme.accent,
      colorScheme: ColorScheme.light().copyWith(secondary: Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),
  );

  static final DARK = ThemeData.dark().copyWith(
    primaryColor: Colors.purple[200],
    accentColor: Colors.purple[100],
    buttonTheme: ButtonThemeData(
      splashColor: offWhite.withOpacity(0.2),
      textTheme: ButtonTextTheme.accent,
      colorScheme: ColorScheme.light().copyWith(
        primary: Colors.purple[300],
        secondary: Colors.white
        ),
        disabledColor: Color(0xff666666),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),
    textTheme: ThemeData.dark().textTheme.copyWith(
      headline1: TextStyle(
        color:Colors.white
      ),
      headline2: TextStyle(
        color:Colors.white
      ),
      headline3: TextStyle(
        color:Colors.white
      ),
      headline4: TextStyle(
        color:Colors.white
      ),
      headline5: TextStyle(
        color:Colors.white
      ),
      headline6: TextStyle(
        color:Colors.white
      ),
      subtitle1: TextStyle(
        color:Colors.white
      ),
      subtitle2: TextStyle(
        color:Colors.white
      ),
      overline: TextStyle(
        color:Colors.white
      ),
      bodyText1:TextStyle(
        color:Colors.white
      ),
      bodyText2:TextStyle(
        color:Colors.white
      ),
      button:TextStyle(
        color:Colors.white
      ),
      caption: TextStyle(
        color:Colors.white
      ),
      
    ),
    appBarTheme: AppBarTheme(
      elevation: 1,
      color: Colors.white,
      brightness: Brightness.light,
      textTheme: TextTheme(
        headline6: TextStyle(color: mainBlack),
        button: TextStyle(color: mainBlack),
      ),
      iconTheme: IconThemeData(color: mainBlack),
      actionsIconTheme: IconThemeData(color: mainBlack),
    ),
    bottomAppBarColor: Colors.blue,
  );
}
