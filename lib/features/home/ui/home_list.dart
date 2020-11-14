import 'package:TamrielTrade/features/home/bloc/home_bloc.dart';
import 'package:TamrielTrade/features/home/ui/item_card.dart';
import 'package:TamrielTrade/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeList extends StatelessWidget {
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels != 0) context.read<HomeBloc>().bottom();
      }
    });

    return context.watch<HomeBloc>().isError
        ? Container(alignment: Alignment.center, child: Text("Error! Boo!"))
        : SingleChildScrollView(
            controller: _controller,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: Dimensions.padding16),
              child: Column(children: _items(context)),
            ),
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
