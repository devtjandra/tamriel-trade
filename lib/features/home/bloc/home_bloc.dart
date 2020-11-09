import 'package:TamrielTrade/features/home/network/home_repository.dart';
import 'package:TamrielTrade/models/item.dart';
import 'package:flutter/material.dart';

class HomeBloc extends ChangeNotifier {
  final BuildContext context;
  final repository = HomeRepository();

  List<Item> items = List();
  bool isWaiting = false;

  HomeBloc(this.context) {
    getItem();
  }

  void getItem() async {
    isWaiting = true;
    notifyListeners();

    items = await repository
        .search("Daedra heart")
        .catchError((error) => debugPrint("Error: ${error.toString()}"));
    isWaiting = false;
    notifyListeners();
  }
}
