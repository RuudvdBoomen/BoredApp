import 'dart:math';

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
  List<Activity> _alternativeActivities = [
    Activity(
        activity: "Try to find an internship ;)",
        type: "education",
        accessibility: 0.6,
        participants: 1,
        price: 0),
    Activity(
        activity: "Go for a night out with some friend",
        type: "social",
        accessibility: 0.7,
        participants: 5,
        price: 0.8),
    Activity(
        activity: "Make your homework",
        type: "education",
        accessibility: 0.8,
        participants: 1,
        price: 0),
    Activity(
        activity: "Practise your juggling skills",
        type: "recreational",
        accessibility: 0.4,
        participants: 1,
        price: 0.2),
  ];

  String _type = "education";
  double _accessibility = 0;
  double _price = 0;
  double _participants = 0;
  Future<Activity> _activity;
  ApiService _apiService = ApiService();
  int _randomInt;

  getPersonalActivity() {
    this._activity = _apiService.getPersonalActivity(
        _accessibility, _type, _participants.toInt(), this._price);
    _randomInt = Random().nextInt(_alternativeActivities.length);
    this.setState(() {});
  }

  void updateAccessibility(double newValue) {
    _accessibility = newValue;
    this.setState(() {});
  }

  void updatePrice(double newValue) {
    _price = newValue;
    this.setState(() {});
  }

  void updateParticipants(double newValue) {
    _participants = newValue;
    this.setState(() {});
  }

  void updateType(String newValue) {
    _type = newValue;
    this.setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Help me find an activity'),
          backgroundColor: Color(0xFF486AF8),
        ),
        body: SingleChildScrollView(
            child: Align(
                alignment: Alignment.center,
                child: Container(
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    width: 0.8 * MediaQuery.of(context).size.width,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          CustomSlider("Accessibility", _accessibility, 0.0, 1.0,
                              updateAccessibility, 0.05),
                          DropdownInput("Type", _type, updateType),
                          CustomSlider("Participants", _participants.toDouble(),
                              0.0, 5.0, updateParticipants, 1),
                          CustomSlider(
                              "Price", _price, 0.0, 1.0, updatePrice, 0.05),
                          RaisedButton(
                              padding: EdgeInsets.all(14),
                              color: Color(0xFF486AF8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: Text("Get personal activity",
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () => getPersonalActivity()),
                          FutureBuilder<Activity>(
                            future: this._activity,
                            builder: (context, snapshot) {
                              print(snapshot);
                              if (snapshot.hasData) {
                                if (snapshot.data.error != null) {
                                  return Column(children: <Widget>[
                                    Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 20),
                                        child: Text(
                                            "No activity found at the Bored API, but Ruud would advise the following activity:",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                            ),
                                            textAlign: TextAlign.center)),
                                    ActivityItem(
                                        _alternativeActivities[_randomInt])
                                  ]);
                                }
                                return Column(children: <Widget>[
                                  Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 20),
                                      child: Text("Activity found:",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                          ))),
                                  ActivityItem(snapshot.data)
                                ]);
                              } else if (snapshot.hasError) {
                                return Text(snapshot.error);
                              }
                              return Container();
                            },
                          ),
                        ])))));
  }
}
