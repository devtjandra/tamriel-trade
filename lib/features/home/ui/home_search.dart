import 'package:TamrielTrade/features/home/bloc/home_bloc.dart';
import 'package:TamrielTrade/views/input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:TamrielTrade/values/values.dart';

class HomeSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.padding16),
      child: Column(
        children: [
          Row(children: [
            Expanded(
                child: Input(
              callback: (value) => context.read<HomeBloc>().setSearch(value),
              hint: "Search",
            )),
            IconButton(icon: Icon(Icons.filter_list_rounded), onPressed: () {}),
          ]),
          Padding(
            padding: EdgeInsets.only(top: Dimensions.padding6),
            child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                color: Colors.black87,
                onPressed: () => context.read<HomeBloc>().search(),
                child: Text("Search", style: TextStyle(color: Colors.white))),
          )
        ],
      ),
    );
  }
}
