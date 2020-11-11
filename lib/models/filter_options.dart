import 'package:TamrielTrade/common/types.dart';
import 'package:flutter/material.dart';

class FilterOptions {
  final int minQuantity;
  final int maxQuantity;
  final int minPrice;
  final int maxPrice;
  final String sortType;
  final String sortOrder;

  FilterOptions(
      {this.minQuantity,
      this.maxQuantity,
      this.minPrice,
      this.maxPrice,
      this.sortType = SortType.lastSeen,
      this.sortOrder = SortOrder.ascending});
}
