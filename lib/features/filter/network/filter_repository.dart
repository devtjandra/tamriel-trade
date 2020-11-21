import 'dart:convert';

import 'package:TamrielTrade/models/category.dart';
import 'package:flutter/services.dart';

class FilterRepository {
  Future<List<Category>> getCategories() async {
    final categories =
        await rootBundle.loadString('assets/config/categories.json');
    return Categories.fromJson(json.decode(categories)).categories;
  }
}