import 'package:TamrielTrade/common/typedefs.dart';
import 'package:TamrielTrade/values/values.dart';
import 'package:flutter/material.dart';

class RadioRow extends StatelessWidget {
  final List<String> options;
  final String selectedOption;
  final StringCallback onSelect;

  RadioRow({@required this.options, this.selectedOption, this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.padding24),
        child: Row(
          children: _options(),
        ));
  }

  List<Widget> _options() {
    List<Widget> widgets = List();
    options.forEach(
        (element) => widgets.add(_option(element, element == selectedOption)));
    return widgets;
  }

  Widget _option(String optionText, bool isSelected) {
    return Expanded(
      child: InkWell(
        onTap: () => onSelect != null ? onSelect(optionText) : () {},
        child: Container(
          decoration: isSelected
              ? BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(90)),
                  border: Border.all(color: Colors.black54, width: 1))
              : null,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: Dimensions.padding12),
          child: Text(
            optionText,
            style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
