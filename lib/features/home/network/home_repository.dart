import 'package:TamrielTrade/models/item.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// This is the most disgusting class I've written in my life
// I am glad it's over
// Forgive me for this Programmer Jesus
class HomeRepository {
  static const baseUrl = "https://us.tamrieltradecentre.com/";

  Future<List<Item>> search(String name,
      {int minQuantity, int maxQuantity, int minPrice, int maxPrice}) async {
    final response = await _call(_dio({
      "searchType": "sell",
      "isChampionPoint": "false",
      "itemNamePattern": name.replaceAll(" ", "+"),
      "amountMin": minQuantity != null ? minQuantity.toString() : "",
      "amountMax": maxQuantity != null ? maxQuantity.toString() : "",
      "priceMin": minPrice != null ? minPrice.toString() : "",
      "priceMax": maxPrice != null ? maxPrice.toString() : "",
    }));

    return _readResponse(response);
  }

  Dio _dio(Map<String, String> params) {
    var dio = Dio();
    dio.options = BaseOptions(
        baseUrl: baseUrl,
        responseType: ResponseType.plain,
        queryParameters: params);
    return dio;
  }

  Future<String> _call(Dio dio) {
    return dio.get("/pc/trade/searchResult").then((value) => value.data);
  }

  List<Item> _readResponse(String response) {
    // debugPrint("Initial: ${response.substring(0, 30)}");
    String removeLines = response.replaceAll("\\\n", " ");
    String removeSpaces = removeLines.replaceAll(" ", "");
    // debugPrint("RemoveLines: $removeLines");
    final cropBefore = removeSpaces.split("trade-list-tablemax-width")[1];
    // debugPrint("CropBefore: $cropBefore");
    final cropAfter = cropBefore.split("</table>")[0];
    // debugPrint("CropAfter: $cropAfter");
    List<String> splitItems = cropAfter.split("alt=\"Icon\"");
    // debugPrint("Total items: ${splitItems.length}");

    List<Item> items = List();

    splitItems.forEach((i) {
      if (splitItems.indexOf(i) == 0) return;

      // debugPrint("Item: $i");
      final splitFields = i.split("<div");
      debugPrint(
          "Split fields for ${splitItems.indexOf(i)} ${splitFields.length}");
      final item = Item(
          name: _formatted(_grabFromDivAfter(splitFields[1]).trim()),
          location: _formatted(_grabFromDivAfter(splitFields[4])),
          trader: _formatted(_grabFromDivAfter(splitFields[5])),
          price: _formatted(_grabFromDivBefore(splitFields[5])),
          quantity: _formatted(_grabFromDivBefore(splitFields[6])),
          total: _formatted(_getTotal(splitFields[7]).split("</td>")[0]),
          lastSeen: _formatted(_getLastSeen(splitFields[7])),
          image: splitFields[0].split("\"")[1]);

      debugPrint(
          "Item: ${item.name} ${item.location} ${item.trader} ${item.image} ${item.price} ${item.quantity} ${item.total} ${item.lastSeen}");
      items.add(item);
    });

    return items;
  }

  String _formatted(String ugly) {
    String formatted = "";
    ugly.replaceAll("&#39;", "'").characters.forEach((char) =>
        char.toLowerCase() != char && !_isNumeric(char)
            ? formatted += " $char"
            : formatted += char);

    return formatted.replaceAll(" :", ":").trim();
  }

  bool _isNumeric(String str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  String _getLastSeen(String div) {
    final lastSeen = div.split("data-mins-elapsed=\"")[1].split("\"></td>")[0];
    return lastSeen;
  }

  String _getTotal(String div) {
    final total = div.split("</td>")[0].split("/>")[1];
    return total;
  }

  String _grabFromDivAfter(String div) {
    final after = div.split(">")[1].split("<")[0];
    return after;
  }

  String _grabFromDivBefore(String div) {
    final split = div.split("/>");
    final before = split[split.length - 1];
    return before;
  }
}
