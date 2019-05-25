import 'package:boring_app/objects/activity.dart';
import 'package:boring_app/pages/survey_page.dart';
import 'package:boring_app/rest/api_service.dart';
import 'package:boring_app/ui/activity_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  ApiService apiService = ApiService();
  Future<Activity> activity;

  getActivity() {
    this.activity = apiService.getActivity();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Menu'),
          backgroundColor: Color(0xFF486AF8),
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            FutureBuilder<Activity>(
              future: this.activity,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                      padding: EdgeInsets.symmetric(vertical: 80),
                      child: ActivityItem(snapshot.data));
                } else if (snapshot.hasError) {
                  return Container(
                      padding: EdgeInsets.symmetric(vertical: 80),
                      child: Text("${snapshot.error}"));
                }
                return Container(
                    padding: EdgeInsets.symmetric(vertical: 80),
                    child: Text("Use the buttons below to get an activity!",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        )));
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                    width: 140,
                    child: RaisedButton(
                        padding: EdgeInsets.all(14),
                        color: Color(0xFF486AF8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Text("Get activity",
                            style: TextStyle(color: Colors.white)),
                        onPressed: () => getActivity())),
                SizedBox(
                    width: 140,
                    child: RaisedButton(
                        padding: EdgeInsets.all(14),
                        color: Color(0xFF486AF8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Text("Search activity",
                            style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => SurveyPage())))),
              ],
            )
          ],
        )));
  }
}
