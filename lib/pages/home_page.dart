import 'package:boring_app/objects/activity.dart';
import 'package:boring_app/rest/api_service.dart';
import 'package:boring_app/ui/activity_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  ApiService apiService = new ApiService();
  Future<Activity> activity;

  getActivity() {
    this.activity = apiService.getActivity();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: const Text('Menu', textAlign: TextAlign.right),
          backgroundColor: Colors.blue,
        ),
        body: Align(
            alignment: Alignment.center,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FutureBuilder<Activity>(
                  future: this.activity,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ActivityItem(snapshot.data);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    // By default, show a loading spinner
                    return CircularProgressIndicator();
                  },
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new RaisedButton(
                        color: Colors.blue,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        child: new Text("Get new activity",
                            style: new TextStyle(color: Colors.white)),
                        onPressed: () => getActivity()),
                    new RaisedButton(
                        color: Colors.blue,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        child: new Text("Search activity",
                            style: new TextStyle(color: Colors.white)),
                        onPressed: () => {}),
                  ],
                )
              ],
            )));
  }
}
