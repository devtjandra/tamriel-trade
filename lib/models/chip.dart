import 'package:flutter/material.dart';

class Chip extends StatelessWidget {
  final String text;

  Chip(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(50.0))),
        child: Text(text, style: TextStyle(color: Colors.white)));
  }
}
