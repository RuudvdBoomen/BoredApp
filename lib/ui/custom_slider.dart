import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  final String _label;
  final double _value;
  final double _min;
  final double _max;
  final double _step;
  final void Function(double) _updateVariable;

  CustomSlider(this._label, this._value, this._min, this._max,
      this._updateVariable, this._step);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(_label,
          style: TextStyle(
            fontSize: 20.0,
          )),
      Slider(
        value: _value.toDouble(),
        min: _min,
        max: _max,
        divisions: _max ~/ _step,
        activeColor: Color(0xFFAB62E9),
        inactiveColor: Colors.black,
        onChanged: (double newValue) {
          _updateVariable(num.parse(newValue.toStringAsFixed(2)));
        },
      ),
    ]);
  }
}
