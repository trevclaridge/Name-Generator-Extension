// ignore_for_file: constant_identifier_names

part of tavern;

class Tavern implements Subcategory {
  final String _subcategory;
  const Tavern._(this._subcategory);

  @override
  String toString() {
    return _subcategory;
  }

  static const Tavern fantasy = Tavern._('fantasy');
}
