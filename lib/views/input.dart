import 'package:TamrielTrade/common/typedefs.dart';
import 'package:TamrielTrade/values/values.dart';
import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final StringCallback onChange;
  final String hint;
  final String definiteValue;
  final bool isCenter;
  final Widget suffixIcon;
  final bool isNumber;

  Input(
      {this.onChange,
      this.hint,
      this.definiteValue,
      this.isCenter = false,
      this.suffixIcon,
      this.isNumber = false});

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.definiteValue != null) controller.text = widget.definiteValue;

    return Container(
        padding: EdgeInsets.all(Dimensions.padding12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(90)),
            border: Border.all(color: Colors.black54, width: 1)),
        child: Row(children: [
          Expanded(
            child: TextField(
              controller: controller,
              textAlign: widget.isCenter ? TextAlign.center : TextAlign.start,
              onChanged: widget.onChange != null ? widget.onChange : (value) {},
              keyboardType:
                  widget.isNumber ? TextInputType.number : TextInputType.text,
              decoration: InputDecoration.collapsed(
                  hintText: this.widget.hint != null ? widget.hint : "",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
          ),
          if (widget.suffixIcon != null) widget.suffixIcon
        ]));
  }
}
