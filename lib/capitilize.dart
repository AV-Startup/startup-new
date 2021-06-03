extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

extension BoolParsing on String {
  bool parseBool() {
    return this.toLowerCase() == 'true';
  }
}
