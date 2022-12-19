// ignore_for_file: constant_identifier_names

part of chaos;

class Chaos implements Subcategory {
  final String _subcategory;
  const Chaos._(this._subcategory);

  @override
  String toString() {
    return _subcategory;
  }

  static const Chaos blipblorp = Chaos._('blipblorp');
  // static const Subcategory Small = Subcategory._('Small');
  // static const Subcategory Medium = Subcategory._('Medium');
  // static const Subcategory Large = Subcategory._('Large');
  // static const Subcategory Huge = Subcategory._('Huge');
  // static const Subcategory Gargantuan = Subcategory._('Gargantuan');
}
