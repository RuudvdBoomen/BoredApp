import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  String label;
  double rating;
  double totalWidth = 200.0;
  Color positiveColor = Color(0xFFAB62E9);
  Color negetiveColor = Colors.white;

  RatingBar(this.label, this.rating);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(this.label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          )),
      Container(
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
