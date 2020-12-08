class SortType {
  static const price = "Price";
  static const lastSeen = "Last Seen";
  static const itemName = "Item Name";
}

class SortOrder {
  static const ascending = "Ascending";
  static const descending = "Descending";
}

class Region {
  static const northAmerica = "North America";
  static const europe = "Europe";

  static String getUrlString(String value) {
    switch (value) {
      case northAmerica:
        return "us";

      case europe:
        return "eu";
    }
  }
}

class Console {
  static const pc = "PC";
  static const xbox = "Xbox";
  static const ps = "PS4";

  static String getUrlString(String value) {
    switch (value) {
      case pc:
        return "pc";

      case xbox:
        return "xb";

      case ps:
        return "ps";
    }
  }
}
