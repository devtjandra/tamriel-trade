import 'package:TamrielTrade/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Expanded(
              child: TextField(
            onChanged: (value) => context.read<HomeBloc>().setSearch(value),
            decoration: InputDecoration(hintText: "Search"),
          )),
          Icon(Icons.filter_outlined)
        ]),
        FlatButton(
            onPressed: () => context.read<HomeBloc>().search(),
            child: Text("Search"))
      ],
    );
  }
}
