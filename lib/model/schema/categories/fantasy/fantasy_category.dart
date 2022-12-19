// ignore_for_file: constant_identifier_names

part of fantasy;

class Fantasy implements Subcategory {
  final String _subcategory;
  const Fantasy._(this._subcategory);

  @override
  String toString() {
    return _subcategory;
  }

  static const Fantasy elf = Fantasy._('elf');
  static const Fantasy dwarf = Fantasy._('dwarf');
  static const Fantasy human = Fantasy._('human');
}
