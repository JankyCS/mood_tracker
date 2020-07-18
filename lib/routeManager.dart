import 'package:flutter/material.dart';
import 'pages/homeApp/home.dart';
import 'pages/homeApp/moodSelect2.dart';
import 'pages/iconCheatSheet.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    print('Navigating to route:' + settings.name);
    var args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => MyHomePage(title: "",));
      case '/ms2':
        return MaterialPageRoute(builder: (context) => MoodSelect2(refresh: args,));
      case '/cheatSheet':
        return MaterialPageRoute(builder: (context) => IconSheet());
      
    }
    return MaterialPageRoute(
        builder: (context) => Text("Broken"));
  }
}
