import 'package:TamrielTrade/common/types.dart';
import 'package:TamrielTrade/features/filter/bloc/filter_bloc.dart';
import 'package:TamrielTrade/features/filter/ui/filter_categories.dart';
import 'package:TamrielTrade/values/values.dart';
import 'package:TamrielTrade/views/horizontal_line.dart';
import 'package:TamrielTrade/views/min_max_input.dart';
import 'package:TamrielTrade/views/radio_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterBody extends StatelessWidget {
  final sortTypes = [SortType.lastSeen, SortType.itemName, SortType.price];
  final sortOrders = [SortOrder.ascending, SortOrder.descending];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: Dimensions.padding24,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.padding24),
                alignment: Alignment.centerLeft,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text("Filtering Options",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0)),
                      ),
                      _filter(context),
                    ]),
              ),
              Container(
                height: Dimensions.padding24,
              ),
              RadioRow(
                  options: sortTypes,
                  selectedOption: context.watch<FilterBloc>().sortType,
                  onSelect: (value) =>
                      context.read<FilterBloc>().setSortType(value)),
              Container(
                height: Dimensions.padding12,
              ),
              RadioRow(
                  options: sortOrders,
                  selectedOption: context.watch<FilterBloc>().sortOrder,
                  onSelect: (value) =>
                      context.read<FilterBloc>().setSortOrder(value)),
              Container(
                height: Dimensions.padding24,
              ),
              HorizontalLine(),
              Container(
                height: Dimensions.padding24,
              ),
              Container(
                  padding: EdgeInsets.only(
                      bottom: Dimensions.padding8,
                      left: Dimensions.padding24,
                      right: Dimensions.padding24),
                  alignment: Alignment.centerLeft,
                  child: Text("Category")),
              FilterCategories(),
              Container(
                height: Dimensions.padding24,
              ),
              HorizontalLine(),
              Container(
                height: Dimensions.padding24,
              ),
              _quantity(context),
              Container(
                height: Dimensions.padding12,
              ),
              _price(context),
              Container(
                height: Dimensions.padding24,
              ),
            ],
          ),
        ));
  }

  Widget _filter(BuildContext context) {
    return RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0))),
        color: Colors.black87,
        onPressed: () => context.read<FilterBloc>().finish(),
        child: Text("Apply", style: TextStyle(color: Colors.white)));
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
