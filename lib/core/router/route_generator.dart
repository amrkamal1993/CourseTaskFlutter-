import 'package:courseapp/core/router/route_names.dart';
import 'package:courseapp/src/view/course_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Alignment pageAlignment = Alignment.bottomCenter;
  static Duration pushDuration = const Duration(milliseconds: 300);
  static Duration popDuration = const Duration(milliseconds: 300);

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    //final args = settings.arguments;

    switch (settings.name) {
      case RouteNames.index:
        return MaterialPageRoute(builder: (context) => const CoursePage());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
      // If there is no such named route in the switch statement, e.g. /third
    }
  }
}
