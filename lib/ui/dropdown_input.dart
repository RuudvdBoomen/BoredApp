import 'package:flutter/material.dart';

class DropdownInput extends StatelessWidget {
  String _label;
  String _selectedValue;
  Function(String) _updateValue;

  DropdownInput(this._label, this._selectedValue, this._updateValue);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(this._label,
            style: TextStyle(
              fontSize: 20.0,
            )),
        DropdownButton<String>(
          value: this._selectedValue,
          onChanged: (String newValue) {
            this._updateValue(newValue);
          },
          items: <String>[
            "education",
            "recreational",
            "social",
            "diy",
            "charity",
            "cooking",
            "relaxation",
            "music",
            "busywork"
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )
      ],
    );
  }
}
