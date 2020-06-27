import 'package:flutter/material.dart';
import 'pages/homeApp/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    print('Navigating to route:' + settings.name);
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => MyHomePage(title: "Poggers",));
    }
    return MaterialPageRoute(
        builder: (context) => Text("Broken"));
  }
}
