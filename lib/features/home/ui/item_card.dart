import 'package:TamrielTrade/models/item.dart';
import 'package:TamrielTrade/views/horizontal_line.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Item item;

  ItemCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(item.name),
        Text(item.location),
        HorizontalLine()
      ],
    );
  }
}