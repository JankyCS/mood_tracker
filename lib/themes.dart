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
}
