import 'package:TamrielTrade/values/values.dart';
import 'package:flutter/material.dart';

class DropdownChip extends StatelessWidget {
  final String _title;
  final VoidCallback callback;

  DropdownChip(this._title, {this.callback});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0))),
        color: Colors.red,
        padding: EdgeInsets.all(Dimensions.padding2),
        onPressed: callback,
        child: Text(_title, style: TextStyle(color: Colors.white)));
  }
}
