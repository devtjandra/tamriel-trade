import 'package:TamrielTrade/features/home/bloc/home_bloc.dart';
import 'package:TamrielTrade/views/dropdown_chip.dart';
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
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.padding24, vertical: Dimensions.padding16),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerRight,
              child: DropdownChip(
                context.watch<HomeBloc>().platformText(),
                callback: () => context.read<HomeBloc>().openPlatform(),
              )),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Tamriel Trade Center",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
          ),
          Container(
            height: Dimensions.padding12,
          ),
          Row(children: [
            Expanded(child: _input(context)),
            Container(
              width: Dimensions.padding6,
            ),
            IconButton(
                icon: Icon(Icons.filter_list_rounded),
                onPressed: () => context.read<HomeBloc>().openFilter()),
          ]),
          Container(
            height: Dimensions.padding6,
          ),
        ],
      ),
    );
  }

  Widget _input(BuildContext context) {
    final autocomplete = context.watch<HomeBloc>().autocompleteResult;
    final isWaiting = context.watch<HomeBloc>().isWaiting;

    return Input(
      onChange: (value) => context.read<HomeBloc>().setSearch(value),
      definiteValue: autocomplete != null ? autocomplete.value : null,
      hint: "Search",
      suffixIcon: isWaiting
          ? ProgressBar()
          : IconButton(
              iconSize: Dimensions.loadingSize,
              icon: Icon(
                Icons.search,
              ),
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              onPressed: () => context.read<HomeBloc>().restartSearch(),
            ),
    );
    // }
  }
}
