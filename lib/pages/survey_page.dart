import 'package:boring_app/objects/activity.dart';
import 'package:boring_app/rest/api_service.dart';
import 'package:boring_app/ui/activity_item.dart';
import 'package:boring_app/ui/custom_slider.dart';
import 'package:boring_app/ui/dropdown_input.dart';
import 'package:flutter/material.dart';

class SurveyPage extends StatefulWidget {
  @override
  SurveyPageState createState() => SurveyPageState();
}

class SurveyPageState extends State<SurveyPage> {
  String type = "education";
  double accessibility = 0.5;
  double price = 0;
  double participants = 0;
  Future<Activity> activity;
  ApiService apiService = new ApiService();

  getPersonalActivity() {
    this.activity = apiService.getPersonalActivity(
        accessibility, type, participants.toInt(), this.price);
    this.setState(() {});
  }

  void updateAccessibility(double newValue) {
    accessibility = newValue;
    this.setState(() {});
  }

  void updatePrice(double newValue) {
    price = newValue;
    this.setState(() {});
  }

  void updateParticipants(double newValue) {
    participants = newValue;
    this.setState(() {});
  }

  void updateType(String newValue) {
    type = newValue;
    this.setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: const Text('Survey', textAlign: TextAlign.right),
          backgroundColor: Colors.blue,
        ),
        body: Align(
            alignment: Alignment.center,
            child: new Container(
                width: 0.8 * MediaQuery.of(context).size.width,
                child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new CustomSlider("Accessibility", accessibility, 0.0, 1.0,
                          updateAccessibility, 0.05),
                      new DropdownInput("Type", type, updateType),
                      new CustomSlider("Participants", participants.toDouble(),
                          0.0, 5.0, updateParticipants, 1),
                      new CustomSlider(
                          "Price", price, 0.0, 1.0, updatePrice, 0.05),
                      new RaisedButton(
                          color: Colors.blue,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          child: new Text("Get personal activity",
                              style: new TextStyle(color: Colors.white)),
                          onPressed: () => getPersonalActivity()),
                      FutureBuilder<Activity>(
                        future: this.activity,
                        builder: (context, snapshot) {
                          print(snapshot);
                          if (snapshot.hasData) {
                            if (snapshot.data.error != null) {
                              return Text(
                                  "No activity found with the given parameters! :(");
                            }
                            return new Column(children: <Widget>[
                              Text("Activity found:"),
                              ActivityItem(snapshot.data)
                            ]);
                          } else if (snapshot.hasError) {
                            return Text(snapshot.error);
                          }
                          return new Container();
                        },
                      ),
                    ]))));
  }
}
