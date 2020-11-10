import 'package:TamrielTrade/features/filter/bloc/filter_bloc.dart';
import 'package:TamrielTrade/values/values.dart';
import 'package:TamrielTrade/views/min_max_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.padding16, vertical: Dimensions.padding12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // _clear(context),
            _quantity(context),
            Container(
              height: Dimensions.padding12,
            ),
            _price(context),
            Container(
              height: Dimensions.padding12,
            ),
            _filter(context)
          ],
        ),
      ),
    );
  }

  Widget _filter(BuildContext context) {
    return RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0))),
        color: Colors.black87,
        onPressed: () => context.read<FilterBloc>().finish(),
        child: Text("Filter", style: TextStyle(color: Colors.white)));
  }

  Widget _clear(BuildContext context) {
    return TextButton(
        onPressed: () => context.read<FilterBloc>().clear(),
        child: Text("Clear"));
  }

  Widget _quantity(BuildContext context) {
    return MinMaxInput(
      title: "Quantity",
      onChangeMin: (value) =>
          context.read<FilterBloc>().setMinQuantity(int.parse(value)),
      onChangeMax: (value) =>
          context.read<FilterBloc>().setMaxQuantity(int.parse(value)),
    );
  }

  Widget _price(BuildContext context) {
    return MinMaxInput(
      title: "Price",
      onChangeMin: (value) =>
          context.read<FilterBloc>().setMinPrice(int.parse(value)),
      onChangeMax: (value) =>
          context.read<FilterBloc>().setMaxPrice(int.parse(value)),
    );
  }
}
