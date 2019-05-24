import 'package:boring_app/objects/activity.dart';
import 'package:boring_app/ui/rating_bar.dart';
import 'package:flutter/material.dart';

class ActivityItem extends StatelessWidget {
  Activity activity;
  ActivityItem(this.activity);

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
        width: 0.8 * MediaQuery.of(context).size.width,
        child: new Column(children: <Widget>[
          new Text(
              '${activity.type[0].toUpperCase()}${activity.type.substring(1)} activity:',
              textAlign: TextAlign.left,
              style: new TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              )),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(activity.activity,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  )),
              new Container(
                  padding: EdgeInsets.all(10),
                  child:
                      new RatingBar("Accessibility:", activity.accessibility)),
              new Text("Participants:",
                  style: new TextStyle(color: Colors.black, fontSize: 20.0)),
              new SizedBox(
                  height: 50,
                  width: 200,
                  child: new ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: activity.participants,
                      itemBuilder: (context, index) {
                        return new Icon(Icons.person, size: 50);
                      })),
              new Container(
                  padding: EdgeInsets.all(10),
                  child: new RatingBar("Price:", activity.price))
            ],
          )
        ]));
  }
}
