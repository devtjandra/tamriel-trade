import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 12.0,
      width: 12.0,
      child: CircularProgressIndicator(
        strokeWidth: 1,
        backgroundColor: Colors.blue,
      ),
    );
  }
}
