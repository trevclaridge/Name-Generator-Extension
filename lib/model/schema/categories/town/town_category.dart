// ignore_for_file: constant_identifier_names

part of town;

class Town implements Subcategory {
  final String _subcategory;
  const Town._(this._subcategory);

  @override
  String toString() {
    return _subcategory;
  }

  static const Town real = Town._('real');
}
