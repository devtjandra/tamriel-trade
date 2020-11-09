import 'package:flutter/material.dart';

class Item {
  final String name;
  final String location;
  final String trader;
  final String price;
  final String quantity;
  final String total;
  final String lastSeen;
  final String image;

  Item({
    @required this.name,
    @required this.location,
    @required this.trader,
    @required this.price,
    @required this.quantity,
    @required this.total,
    this.lastSeen,
    this.image
  });
}