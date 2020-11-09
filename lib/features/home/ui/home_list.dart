import 'package:TamrielTrade/features/home/bloc/home_bloc.dart';
import 'package:TamrielTrade/features/home/ui/item_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: _items(context)),
    );
  }

  List<Widget> _items(BuildContext context) {
    final items = context.watch<HomeBloc>().items;
    List<Widget> cards = List();
    if (items != null && items.isNotEmpty)
      items.forEach((element) => cards.add(ItemCard(element)));
    return cards;
  }
}
