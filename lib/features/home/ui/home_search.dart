import 'package:TamrielTrade/features/home/bloc/home_bloc.dart';
import 'package:TamrielTrade/views/input.dart';
import 'package:TamrielTrade/views/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:TamrielTrade/values/values.dart';

class HomeSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(Dimensions.padding16),
      child: Column(
        children: [
          Row(children: [
            Expanded(child: _input(context)),
            IconButton(
                icon: Icon(Icons.filter_list_rounded),
                onPressed: () => context.read<HomeBloc>().openFilter()),
          ]),
          Container(
            height: Dimensions.padding6,
          ),
          RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50.0))),
              color: Colors.black87,
              onPressed: () => context.read<HomeBloc>().restartSearch(),
              child: Text("Search", style: TextStyle(color: Colors.white))),
          Container(
            height: Dimensions.padding6,
          ),
          AnimatedOpacity(
            opacity: context.watch<HomeBloc>().isWaiting ? 1 : 0,
            duration: Duration(milliseconds: 100),
            child: ProgressBar(),
          )
        ],
      ),
    );
  }

  Widget _input(BuildContext context) {
    final autocomplete = context.watch<HomeBloc>().autocompleteResult;

    if (autocomplete != null) {
      return InkWell(
          onTap: () => context.read<HomeBloc>().clearAutocomplete(),
          child: Input(
            definiteValue: autocomplete.value,
          ));
    } else {
      return Input(
        onChange: (value) => context.read<HomeBloc>().setSearch(value),
        hint: "Search",
      );
    }
  }
}
