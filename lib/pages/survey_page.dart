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
  ApiService apiService = ApiService();

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
        appBar: AppBar(
          title: const Text('Survey'),
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
                          CustomSlider("Accessibility", accessibility, 0.0, 1.0,
                              updateAccessibility, 0.05),
                          DropdownInput("Type", type, updateType),
                          CustomSlider("Participants", participants.toDouble(),
                              0.0, 5.0, updateParticipants, 1),
                          CustomSlider(
                              "Price", price, 0.0, 1.0, updatePrice, 0.05),
                          RaisedButton(
                              padding: EdgeInsets.all(14),
                              color: Color(0xFF486AF8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: Text("Get personal activity",
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () => getPersonalActivity()),
                          FutureBuilder<Activity>(
                            future: this.activity,
                            builder: (context, snapshot) {
                              print(snapshot);
                              if (snapshot.hasData) {
                                if (snapshot.data.error != null) {
                                  return Container(
                                      padding: EdgeInsets.all(20),
                                      child: Text(
                                          "No activity found with the given parameters! :(",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                          ),
                                          textAlign: TextAlign.center));
                                }
                                return Column(children: <Widget>[
                                  Container(
                                      padding: EdgeInsets.all(20),
                                      child: Text("Found activity:",
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
