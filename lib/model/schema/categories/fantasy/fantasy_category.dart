// ignore_for_file: constant_identifier_names

part of fantasy;

// class Fantasy implements Subcategory {
//   final String _subcategory;
//   const Fantasy._(this._subcategory);

//   @override
//   String toString() {
//     return _subcategory;
//   }

//   static const Fantasy elf = Fantasy._('elf');
//   static const Fantasy dwarf = Fantasy._('dwarf');
//   static const Fantasy human = Fantasy._('human');
// }

class Fantasy implements Category {
  final String _name = 'Fantasy';

  Fantasy(subcategoryPref) {
    activeSubcategory = parse(subcategoryPref);
  }

  @override
  IconData icon = FontAwesomeIcons.sprayCanSparkles;

  @override
  Subcategory activeSubcategory = Elf();

  @override
  List<Subcategory> subcategories = [Elf(), Human(), Dwarf()];

  @override
  List<Subcategory> getSubcategories() {
    return subcategories;
  }

  @override
  Subcategory parse(String subcategoryPref) {
    Subcategory tempSubcategory = Elf();
    for (Subcategory subcategory in subcategories) {
      if (subcategoryPref == subcategory.getName()) {
        tempSubcategory = subcategory;
      }
    }
    return tempSubcategory;
  }

  @override
  String getName() {
    return _name;
  }
}
