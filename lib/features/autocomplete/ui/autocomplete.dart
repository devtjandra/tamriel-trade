import 'package:TamrielTrade/features/autocomplete/ui/result_card.dart';
import 'package:TamrielTrade/features/home/bloc/home_bloc.dart';
import 'package:TamrielTrade/values/values.dart';
import 'package:TamrielTrade/views/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Autocomplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.padding24, vertical: Dimensions.padding16),
        child: SingleChildScrollView(
          child: Column(children: _items(context)),
        ));
  }

  List<Widget> _items(BuildContext context) {
    if (context.watch<HomeBloc>().isWaitingAutocomplete) return [ProgressBar()];

    final results = context.watch<HomeBloc>().results;
    List<Widget> cards = List();

    if (results != null && results.isNotEmpty)
      results.forEach((element) => cards.add(ResultCard(element)));
      
    return cards;
  }
}
