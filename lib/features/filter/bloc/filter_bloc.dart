import 'package:TamrielTrade/common/types.dart';
import 'package:TamrielTrade/features/filter/network/filter_repository.dart';
import 'package:TamrielTrade/features/home/bloc/home_bloc.dart';
import 'package:TamrielTrade/models/category.dart';
import 'package:TamrielTrade/models/filter_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterBloc extends ChangeNotifier {
  final BuildContext _context;
  final repository = FilterRepository();

  int _minQuantity;
  int _maxQuantity;
  int _minPrice;
  int _maxPrice;
  String sortType = SortType.lastSeen;
  String sortOrder = SortOrder.ascending;
  List<Category> categories;
  Category category;
  Subcategory subcategory;
  Subsubcategory subsubcategory;

  FilterBloc(this._context) {
    getCategories();
  }

  void getCategories() async {
    categories = await repository.getCategories();
    debugPrint("New categories! ${categories.length}");
    notifyListeners();
  }

  void setCategory(Category value) {
    category = value;
    subcategory = null;
    subsubcategory = null;
    notifyListeners();
  }

  void setSubcategory(Subcategory value) {
    subcategory = value;
    subsubcategory = null;
    notifyListeners();
  }

  void setSubsubcategory(Subsubcategory value) {
    subsubcategory = value;
    notifyListeners();
  }

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

  void setSortType(String value) {
    sortType = value;
    notifyListeners();
  }

  void setSortOrder(String value) {
    sortOrder = value;
    notifyListeners();
  }

  void finish() {
    _context.read<HomeBloc>().setFilterOptions(FilterOptions(
        minQuantity: _minQuantity,
        maxQuantity: _maxQuantity,
        minPrice: _minPrice,
        maxPrice: _maxPrice,
        sortType: sortType,
        sortOrder: sortOrder,
        category1: category != null ? category.id : null,
        category2: subcategory != null ? subcategory.id : null,
        category3: subsubcategory != null ? subsubcategory.id : null));
  }
}
