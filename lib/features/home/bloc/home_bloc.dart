import 'package:TamrielTrade/features/home/network/home_repository.dart';
import 'package:TamrielTrade/models/item.dart';
import 'package:flutter/material.dart';

class HomeBloc extends ChangeNotifier {
  final BuildContext context;
  final repository = HomeRepository();

  List<Item> items = List();
  bool isWaiting = false;
  bool isError = false;
  int page = 1;
  String searchValue = "";

  HomeBloc(this.context);

  void setSearch(String value) {
    searchValue = value;
    notifyListeners();
  }

  void restartSearch() {
    FocusScope.of(context).unfocus();

    items.clear();
    page = 1;

    search();
  }

  void bottom() {
    if (items.isEmpty || items.length % 10 > 0) return;

    search();
  }

  void search() async {
    if (isWaiting) return;
    if (searchValue.isEmpty) return;

    isError = false;
    isWaiting = true;
    notifyListeners();

    await repository.search(searchValue, page: page).then((value) {
      items.addAll(value);
      page++;
    }).catchError((error) {
      if (items.isEmpty) isError = true;
      isWaiting = false;
      notifyListeners();
    });

    isWaiting = false;
    notifyListeners();
  }
}
