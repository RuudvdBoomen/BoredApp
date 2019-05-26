import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final String _label;
  final double _rating;
  final double _totalWidth = 200.0;
  final Color _positiveColor = Color(0xFFAB62E9);
  final Color _negetiveColor = Colors.white;

  RatingBar(this._label, this._rating);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(this._label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          )),
      Container(
        width: _totalWidth + 4.0,
        height: 30.0,
        decoration: BoxDecoration(
            color: _negetiveColor,
            border: Border.all(color: Colors.black, width: 2.0)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              color: _positiveColor,
              width: (_rating) * _totalWidth,
            ),
          ],
        ),
      )
    ]);
  }
}
