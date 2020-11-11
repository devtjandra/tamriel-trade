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
    return Row(
      children: _options(),
    );
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
          padding: EdgeInsets.all(Dimensions.padding6),
          color: isSelected ? Colors.blue : Colors.white,
          child: Text(optionText),
        ),
      ),
    );
  }
}
