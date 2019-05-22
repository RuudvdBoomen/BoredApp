import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  String label;
  double rating;
  double totalWidth = 200.0;
  Color positiveColor = Colors.purple;
  Color negetiveColor = Colors.white;

  RatingBar(this.label, this.rating);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
      new Text(this.label,
          style: new TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          )),
      new Container(
        width: totalWidth + 4.0,
        height: 30.0,
        decoration: BoxDecoration(
            color: negetiveColor,
            border: Border.all(color: Colors.black, width: 2.0)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              color: positiveColor,
              width: (rating) * totalWidth,
            ),
          ],
        ),
      )
    ]);
  }
}
