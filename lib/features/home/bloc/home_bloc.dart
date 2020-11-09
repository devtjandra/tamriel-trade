import 'package:TamrielTrade/features/home/network/home_repository.dart';
import 'package:TamrielTrade/models/item.dart';
import 'package:flutter/material.dart';

class HomeBloc extends ChangeNotifier {
  final BuildContext context;
  final repository = HomeRepository();

  List<Item> items = List();
  bool isWaiting = false;
  String searchValue = "";

  HomeBloc(this.context);

  void setSearch(String value) {
    searchValue = value;
    notifyListeners();
  }

  void search() async {
    if (searchValue.isEmpty) return;

    isWaiting = true;
    notifyListeners();

    items = await repository
        .search(searchValue)
        .catchError((error) => debugPrint("Error: ${error.toString()}"));
    isWaiting = false;
    notifyListeners();
  }
}
