import 'package:TamrielTrade/models/item.dart';
import 'package:TamrielTrade/values/values.dart';
import 'package:TamrielTrade/views/horizontal_line.dart';
import 'package:TamrielTrade/views/item_image.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Item item;

  ItemCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.padding24, vertical: Dimensions.padding12),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: Styles.cardBorder,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: const Color(0x1a000000),
                  offset: Offset(0, 5),
                  blurRadius: 12,
                  spreadRadius: 7)
            ]),
        child: _item(),
      ),
    );
  }

  Widget _item() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: Dimensions.padding12,
        ),
        _lastSeen(),
        _header(),
        HorizontalLine(),
        Container(
          height: Dimensions.padding12,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.padding24),
          child: Text(
            "Location",
            style: Styles.description,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.padding24),
          child: Text(item.location),
        ),
        Container(
          height: Dimensions.padding6,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.padding24),
          child: Text(
            "Trader",
            style: Styles.description,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.padding24),
          child: Text(item.trader),
        ),
        Container(
          height: Dimensions.padding12,
        ),
        HorizontalLine(),
        Container(
          height: Dimensions.padding8,
        ),
        _priceRow("Price", item.price, false),
        _priceRow("Quantity", item.quantity, false),
        _priceRow("Total", item.total, true),
        Container(
          height: Dimensions.padding16,
        ),
      ],
    );
  }

  Widget _priceRow(String key, String value, bool isTotal) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.padding2, horizontal: Dimensions.padding24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Text(key)),
          Text(
            value,
            style: TextStyle(
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal),
          )
        ],
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: EdgeInsets.only(
          bottom: Dimensions.padding12,
          left: Dimensions.padding24,
          right: Dimensions.padding24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ItemImage(item.image),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.padding12),
            child:
                Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
          ))
        ],
      ),
    );
  }

  Widget _lastSeen() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.padding24),
        alignment: Alignment.centerRight,
        child: Text(_time(), style: Styles.description));
  }

  String _time() {
    debugPrint("Item last seen: ${item.lastSeen}");
    
    final time = int.parse(item.lastSeen);

    if (time < 60) return "$time mins ago";

    if (time < 1440)
      return "${time ~/ 60} hours ${time % 60} mins ago";
    else
      return "${time ~/ 1400} days ago";
  }
}
