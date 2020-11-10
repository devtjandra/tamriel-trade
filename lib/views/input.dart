import 'package:TamrielTrade/common/typedefs.dart';
import 'package:TamrielTrade/values/values.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final StringCallback onChange;
  final String hint;

  Input({this.onChange, this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.padding12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(90)),
          border: Border.all(color: Colors.black54, width: 1)),
      child: TextField(
        onChanged: onChange != null ? onChange : (value) {},
        decoration: InputDecoration.collapsed(
            hintText: this.hint != null ? hint : "",
            hintStyle: TextStyle(color: Colors.grey)),
      ),
    );
  }
}
