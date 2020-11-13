import 'package:TamrielTrade/models/autocomplete_result.dart';
import 'package:TamrielTrade/values/values.dart';
import 'package:dio/dio.dart';

class AutocompleteRepository {
  Future<List<AutocompleteResult>> autocomplete(String query) async {
    final dio = Dio();
    dio.options =
        BaseOptions(baseUrl: Strings.baseUrl, queryParameters: {"term": query});
    final response = await dio.get("/api/pc/Trade/GetItemAutoComplete");
    final resultMap = response.data as List<Map<String, dynamic>>;

    List<AutocompleteResult> results = List();
    resultMap.forEach((element) {
      results.add(AutocompleteResult(
          itemId: element["ItemID"],
          value: element["value"],
          icon: element["IconName"]));
    });
  }
}
