import 'package:boring_app/pages/home_page.dart';
import 'package:boring_app/pages/survey_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Challenge',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => HomePage(),
        '/survey': (BuildContext context) => SurveyPage(),
      },
    );
  }
}