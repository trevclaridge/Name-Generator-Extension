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

  Subcategory parse(String subcategoryPref) {
    Subcategory tempSubcategory = Elf();
    for (Subcategory subcategory in subcategories) {
      if (subcategoryPref == subcategory.toString()) {
        tempSubcategory = subcategory;
      }
    }
    return tempSubcategory;
  }
}
