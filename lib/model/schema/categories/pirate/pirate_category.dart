// ignore_for_file: constant_identifier_names

part of pirate;

class Pirate implements Subcategory {
  final String _subcategory;
  const Pirate._(this._subcategory);

  @override
  String toString() {
    return _subcategory;
  }

  static const Pirate sailor = Pirate._('sailor');
  static const Pirate ship = Pirate._('ship');
}
