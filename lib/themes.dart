import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Themes {
  static final Color mainBlack = Colors.black;
  static final Color mainWhite = Colors.white;
  static final Color mainGrey = Color.fromRGBO(155, 155, 155, 1);
  static final Color tdGreen = Color.fromRGBO(0, 200, 83, 1);
  static final Color offWhite = Color.fromRGBO(249, 249, 249, 1.0);
  static final Color darkGrey = Color.fromRGBO(74, 74, 74, 1.0);

  static final LIGHT = ThemeData(
    brightness: Brightness.light,
    // canvasColor: mainWhite,
    // scaffoldBackgroundColor: mainWhite,
    // cardColor: mainWhite,
    // primaryColor: mainWhite,
    primaryColorBrightness: Brightness.light,
    accentColor: tdGreen,
    accentColorBrightness: Brightness.dark,
    backgroundColor: offWhite,
    highlightColor: offWhite.withOpacity(0.8),
    disabledColor: mainGrey,
    textTheme: TextTheme(
      button: TextStyle(
        fontSize: 17,
        color: tdGreen,
        fontWeight: FontWeight.w600,
      ),
      title: TextStyle(
        color: Color.fromARGB(255, 3, 3, 3),
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      subhead: TextStyle(
        color: Color.fromRGBO(122, 122, 122, 0.63),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      subtitle: TextStyle(
        color: darkGrey,
        fontSize: 12,
      ),
      body1: TextStyle(
        fontSize: 14,
        color: mainGrey,
        fontWeight: FontWeight.w500,
      ),
      body2: TextStyle(
        fontSize: 14,
        color: mainBlack,
        fontWeight: FontWeight.w600,
      ),
      overline: TextStyle(
        color: mainGrey,
        fontSize: 10,
        fontWeight: FontWeight.w600,
      ),
      caption: TextStyle(
        fontSize: 10,
        color: Color.fromRGBO(122, 122, 122, 0.64),
        fontWeight: FontWeight.w600,
      ),
    ),
    accentTextTheme: TextTheme(
      caption: TextStyle(color: mainWhite, fontSize: 10),
      button: TextStyle(
        fontSize: 17,
        color: mainWhite,
        fontWeight: FontWeight.w600,
      ),
    ),
    appBarTheme: AppBarTheme(
      color: Colors.blue,
      elevation: 0,
      brightness: Brightness.light,
      textTheme: TextTheme(
        title: TextStyle(color: mainBlack),
        button: TextStyle(color: mainBlack),
      ),
      iconTheme: IconThemeData(color: mainBlack),
      actionsIconTheme: IconThemeData(color: mainBlack),
    ),
    cupertinoOverrideTheme: CupertinoThemeData(primaryColor: tdGreen),
    buttonTheme: ButtonThemeData(
      splashColor: offWhite.withOpacity(0.2),
      buttonColor: tdGreen,
      textTheme: ButtonTextTheme.accent,
      colorScheme: ColorScheme.light().copyWith(secondary: Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(fontSize: 15.0, color: darkGrey),
    ),
  );
}
