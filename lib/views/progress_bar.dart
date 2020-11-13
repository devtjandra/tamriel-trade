import 'package:TamrielTrade/values/values.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.loadingSize,
      width: Dimensions.loadingSize,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        // backgroundColor: Colors.blue,
      ),
    );
  }
}
