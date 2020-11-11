import 'package:TamrielTrade/models/filter_options.dart';
import 'package:TamrielTrade/models/item.dart';
import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

class HomeRepository {
  static const baseUrl = "https://us.tamrieltradecentre.com/";

  Future<List<Item>> search(String name,
      {int page, FilterOptions options}) async {
    final params = {
      "searchType": "sell",
      "page": page != null ? page.toString() : "1",
      "isChampionPoint": "false",
      "itemNamePattern": name.replaceAll(" ", "+"),
      "amountMin":
          options.minQuantity != null ? options.minQuantity.toString() : "",
      "amountMax":
          options.maxQuantity != null ? options.maxQuantity.toString() : "",
      "priceMin": options.minPrice != null ? options.minPrice.toString() : "",
      "priceMax": options.maxPrice != null ? options.maxPrice.toString() : "",
      "sortBy": options.sortType != null ? options.sortType : "",
      "order": options.sortOrder != null ? options.sortOrder : "",
    };

    final webScraper = WebScraper(baseUrl);
    await webScraper.loadWebPage(getRequest(params));

    final result = webScraper.getElement('tr.cursor-pointer', []);
    final images = webScraper.getElement('img.trade-item-icon', ['src']);
    final lastSeens = webScraper
        .getElement('tr.cursor-pointer > td.hidden-xs', ['data-mins-elapsed']);

    List<Map<String, dynamic>> validSeen = List();

    lastSeens.forEach((element) {
      if (element["attributes"].containsKey("data-mins-elapsed") &&
          element["attributes"]["data-mins-elapsed"] != null)
        validSeen.add(element);
    });

    List<Item> items = List();

    result.forEach((element) {
      final index = result.indexOf(element);
      final image = images[index]["attributes"]["src"];
      final lastSeen = validSeen[index]["attributes"]["data-mins-elapsed"];

      final value = element["title"] as String;

      List<String> valueSplit = value.split("\n");
      List<String> actualValues = List();

      valueSplit.forEach((element) {
        if (element.replaceAll(" ", "").isNotEmpty) {
          actualValues.add(element);
          debugPrint(element);
        }
      });

      if (actualValues.length == 11)
        items.add(Item(
          name: actualValues[0].trim(),
          location: actualValues[4].trim(),
          trader: actualValues[5].trim(),
          price: actualValues[6].trim(),
          quantity: actualValues[8].trim(),
          total: actualValues[10].trim(),
          lastSeen: lastSeen,
          image: image,
        ));
    });

    debugPrint("returning ${items.length} items");
    return items;
  }

  String getRequest(Map<String, String> params) {
    String request = "/pc/trade/searchResult?";
    params.forEach((key, value) => request += "$key=$value&");
    debugPrint("Request: $request");
    return request;
  }
}
