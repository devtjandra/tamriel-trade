import 'package:TamrielTrade/common/typedefs.dart';
import 'package:TamrielTrade/values/values.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final StringCallback onChange;
  final String hint;
  final String definiteValue;

  Input({this.onChange, this.hint, this.definiteValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.padding12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(90)),
          border: Border.all(color: Colors.black54, width: 1)),
      child: definiteValue != null
          ? Padding(
              padding: EdgeInsets.symmetric(vertical: Dimensions.padding2),
              child: Text(definiteValue))
          : TextField(
              onChanged: onChange != null ? onChange : (value) {},
              decoration: InputDecoration.collapsed(
                  hintText: this.hint != null ? hint : "",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
    );
  }
}
