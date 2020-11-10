import 'package:TamrielTrade/features/home/bloc/home_bloc.dart';
import 'package:TamrielTrade/models/filter_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterBloc extends ChangeNotifier {
  final BuildContext _context;

  int _minQuantity;
  int _maxQuantity;
  int _minPrice;
  int _maxPrice;

  FilterBloc(this._context);

  void setMinQuantity(int value) {
    _minQuantity = value;
    notifyListeners();
  }

  void setMaxQuantity(int value) {
    _maxQuantity = value;
    notifyListeners();
  }

  void setMinPrice(int value) {
    _minPrice = value;
    notifyListeners();
  }

  void setMaxPrice(int value) {
    _maxPrice = value;
    notifyListeners();
  }

  void clear() {
    // TODO: Damn this might take a while
  }

  void finish() {
    _context.read<HomeBloc>().setFilterOptions(FilterOptions(
        minQuantity: _minQuantity,
        maxQuantity: _maxQuantity,
        minPrice: _minPrice,
        maxPrice: _maxPrice));
  }
}
