import 'package:TamrielTrade/models/item.dart';
import 'package:TamrielTrade/values/values.dart';
import 'package:TamrielTrade/views/item_image.dart';
import 'package:TamrielTrade/views/horizontal_line.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Item item;

  ItemCard(this.item);

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _lastSeen(),
          _header(),
          Text(
            "Location",
            style: Styles.description,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: Dimensions.padding6),
            child: Text(item.location),
          ),
          Text(
            "Trader",
            style: Styles.description,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: Dimensions.padding6),
            child: Text(item.trader),
          ),
          _priceRow("Price", item.price, false),
          _priceRow("Quantity", item.quantity, false),
          _priceRow("Total", item.total, true),
        ],
      ),
    );
  }

  Widget _priceRow(String key, String value, bool isTotal) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.padding2),
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
      padding: EdgeInsets.only(bottom: Dimensions.padding6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ItemImage(item.image),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.padding12),
            child: Text(item.name),
          ))
        ],
      ),
    );
  }

  Widget _lastSeen() {
    return Align(
        alignment: Alignment.centerRight,
        child: Text(_time(), style: Styles.description));
  }

  String _time() {
    final time = int.parse(item.lastSeen);

    if (time < 60) return "$time mins ago";

    if (time < 1440)
      return "${time ~/ 60} hours ${time % 60} mins ago";
    else
      return "${time ~/ 1400} days ago";
  }
}
