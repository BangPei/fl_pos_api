class Capitalize {
  static text(String string) {
    if (string.isEmpty) {
      throw ArgumentError("string: $string");
    }

    if (string.isEmpty) {
      return string;
    }

    return string.split(' ').map((word) {
      if (word != "") {
        return word[0].toUpperCase() + word.substring(1);
      } else {
        return "";
      }
    }).join(' ');
  }
}
