import 'package:TamrielTrade/values/values.dart';
import 'package:flutter/material.dart';

class ItemImage extends StatelessWidget {
  final String imageSrc;

  ItemImage(this.imageSrc);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Dimensions.image,
        height: Dimensions.image,
        child: Image.network(
          "https://us.tamrieltradecentre.com$imageSrc",
          fit: BoxFit.fill,
        ));
  }
}
