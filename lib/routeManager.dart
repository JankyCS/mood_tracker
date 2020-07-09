import 'package:flutter/material.dart';
import 'pages/homeApp/home.dart';
import 'pages/homeApp/moodSelect2.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    print('Navigating to route:' + settings.name);
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => MyHomePage(title: "Poggers",));
      case '/ms2':
        return MaterialPageRoute(builder: (context) => MoodSelect2());
    }
    return MaterialPageRoute(
        builder: (context) => Text("Broken"));
  }
}
