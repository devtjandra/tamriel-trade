import 'package:flutter/material.dart';

class DropdownChip extends StatelessWidget {
  final String _title;
  final VoidCallback callback;

  DropdownChip(this._title, {this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            _title,
            style: TextStyle(
                color: Colors.blueAccent, fontWeight: FontWeight.bold),
          ),
          Icon(Icons.arrow_drop_down_outlined, color: Colors.blueAccent)
        ],
      ),
    );
  }
}
