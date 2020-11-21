import 'package:TamrielTrade/common/types.dart';
import 'package:flutter/material.dart';

class FilterOptions {
  final int minQuantity;
  final int maxQuantity;
  final int minPrice;
  final int maxPrice;
  final String sortType;
  final String sortOrder;
  final int category1;
  final int category2;
  final int category3;

  FilterOptions(
      {this.minQuantity,
      this.maxQuantity,
      this.minPrice,
      this.maxPrice,
      this.sortType = SortType.lastSeen,
      this.sortOrder = SortOrder.ascending,
      this.category1,
      this.category2,
      this.category3});
}
