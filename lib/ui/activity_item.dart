import 'package:boring_app/objects/activity.dart';
import 'package:boring_app/ui/rating_bar.dart';
import 'package:flutter/material.dart';

class ActivityItem extends StatelessWidget {
  final Activity _activity;
  ActivityItem(this._activity);

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.all(15),
        decoration: new BoxDecoration(
            color: new Color(0xFFF2BAB0),
            borderRadius: new BorderRadius.all(Radius.circular(20))),
        child: SizedBox(
            width: 0.7 * MediaQuery.of(context).size.width,
            height: 320,
            child: Stack(children: <Widget>[
              Text(
                  '${_activity.type[0].toUpperCase()}${_activity.type.substring(1)} activity!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  )),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(_activity.activity,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20.0,
                              )),
                          Container(
                              padding: EdgeInsets.all(10),
                              child: RatingBar(
                                  "Accessibility:", _activity.accessibility)),
                          Text("Participants:",
                              style: TextStyle(fontSize: 20.0)),
                          SizedBox(
                              height: 50,
                              width: 200,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: _activity.participants,
                                  itemBuilder: (context, index) {
                                    return Icon(Icons.person, size: 50);
                                  })),
                          Container(
                              padding: EdgeInsets.all(10),
                              child: RatingBar("Price:", _activity.price))
                        ],
                      )))
            ])));
  }
}
