import 'package:TamrielTrade/values/values.dart';
import 'package:flutter/material.dart';

typedef StringCallback = Function(String value);

class Input extends StatelessWidget {
  final StringCallback callback;
  final String hint;

  Input({this.callback, this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.padding12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(90)),
          border: Border.all(color: Colors.black54, width: 1)),
      child: TextField(
        onChanged: callback != null ? callback : () {},
        decoration: InputDecoration.collapsed(
            hintText: this.hint != null ? hint : "",
            hintStyle: TextStyle(color: Colors.grey)),
      ),
    );
  }
}
