

import 'package:flutter/material.dart';

Widget checkboxItem({
  required String checkboxtext,
  required bool valueBox,
   required Null Function(dynamic valueBox) function
})=> CheckboxListTile(
  activeColor: Colors.black,
  value: valueBox,
  onChanged: function,

  title: Text(checkboxtext),
  isThreeLine: false,
  dense: true,
  secondary: Icon(Icons.hourglass_empty),
  selected: true,
  controlAffinity: ListTileControlAffinity.platform,
);