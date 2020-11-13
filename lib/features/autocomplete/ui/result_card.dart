import 'package:TamrielTrade/models/autocomplete_result.dart';
import 'package:TamrielTrade/values/values.dart';
import 'package:TamrielTrade/views/horizontal_line.dart';
import 'package:TamrielTrade/views/item_image.dart';
import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final AutocompleteResult result;

  ResultCard(this.result);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_item(), HorizontalLine()],
    );
  }

  Widget _item() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.padding16, vertical: Dimensions.padding12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemImage("/content/icons/${result.icon}"),
          Expanded(
              child: Text(
            result.value,
          ))
        ],
      ),
    );
  }
}
