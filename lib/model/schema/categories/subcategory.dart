part of model;

// https://ra9r.medium.com/overcoming-the-limitations-of-dart-enum-8866df8a1c47

abstract class Subcategory {
  final String _name;
  const Subcategory(this._name);

  @override
  String toString() {
    return _name;
  }
}
