import 'package:TamrielTrade/common/types.dart';
import 'package:TamrielTrade/features/home/network/home_repository.dart';
import 'package:TamrielTrade/models/autocomplete_result.dart';
import 'package:TamrielTrade/models/item.dart';
import 'package:TamrielTrade/models/filter_options.dart';
import 'package:TamrielTrade/models/platform_options.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeBloc extends ChangeNotifier {
  final BuildContext _context;
  final PanelController _filterController;
  final PanelController _platformSelectorController;
  final PanelController _autocompleteController;
  final repository = HomeRepository();

  List<Item> items = List();
  bool isWaiting = false;
  bool isError = false;
  int page = 1;
  String searchValue = "";

  FilterOptions filterOptions = FilterOptions();
  PlatformOptions platformOptions =
      PlatformOptions(region: Region.northAmerica, console: Console.pc);

  bool isWaitingAutocomplete = false;
  List<AutocompleteResult> results = List();
  AutocompleteResult autocompleteResult;

  HomeBloc(this._context, this._filterController,
      this._platformSelectorController, this._autocompleteController);

  // Updates the search value in the bloc.
  void setSearch(String value) {
    searchValue = value;

    if (value.length > 2 && autocompleteResult == null)
      _openAutocomplete();
    else if (autocompleteResult != null && value != autocompleteResult.value)
      autocompleteResult = null;

    notifyListeners();
  }

  // Calls the search API.
  void _search() async {
    if (isWaiting) return;
    if (searchValue.isEmpty) return;

    isError = false;
    isWaiting = true;
    notifyListeners();

    await repository
        .search(searchValue,
            page: page, options: filterOptions, platform: platformOptions)
        .then((value) {
      items.addAll(value);
      page++;
    }).catchError((error) {
      debugPrint("Error: $error");
      if (items.isEmpty) isError = true;
      isWaiting = false;
      notifyListeners();
    });

    isWaiting = false;
    notifyListeners();
  }

  // Restarts the lazy load and fetches data again.
  void restartSearch() {
    FocusScope.of(_context).unfocus();
    _autocompleteController.close();
    _filterController.close();

    items.clear();
    page = 1;

    _search();
  }

  // Goes to next page when list reaches bottom.
  void bottom() {
    if (items.isEmpty || items.length % 10 > 0) return;

    _search();
  }

  // Opens up the filter panel.
  void openFilter() {
    FocusScope.of(_context).unfocus();
    _autocompleteController.close();
    _platformSelectorController.close();
    _filterController.open();
  }

  void openPlatform() {
    FocusScope.of(_context).unfocus();
    _autocompleteController.close();
    _filterController.close();
    _platformSelectorController.open();
  }

  // Returns from the filter panel with some new filters.
  void setFilterOptions(FilterOptions value) {
    filterOptions = value;
    _filterController.close();
    restartSearch();
  }

  // Returns from the filter panel with some new filters.
  void setPlatformOptions(PlatformOptions value) {
    platformOptions = value;
    notifyListeners();
    _platformSelectorController.close();
    restartSearch();
  }

  String platformText() {
    return "${platformOptions.console} - ${platformOptions.region}";
  }

  // Opens up the autocomplete panel.
  void _openAutocomplete() {
    _filterController.close();
    _platformSelectorController.close();
    _autocompleteController.open();
    autocomplete();
  }

  // Returns from the autocomplete panel with a new autocomplete.
  void setAutocomplete(AutocompleteResult result) {
    autocompleteResult = result;
    notifyListeners();
    _autocompleteController.close();
    restartSearch();
  }

  void clearAutocomplete() {
    autocompleteResult = null;
    notifyListeners();
  }

  void autocomplete() async {
    if (isWaitingAutocomplete) return;
    if (searchValue.isEmpty) return;

    // isError = false;
    isWaitingAutocomplete = true;
    notifyListeners();

    await repository.autocomplete(searchValue, platformOptions).then((value) {
      results = value;
    }).catchError((error) {
      // if (items.isEmpty) isError = true;
      isWaitingAutocomplete = false;
      notifyListeners();
    });

    isWaitingAutocomplete = false;
    notifyListeners();
  }
}
