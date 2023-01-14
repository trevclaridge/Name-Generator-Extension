// ignore_for_file: constant_identifier_names

part of fantasy;

class Fantasy implements Category {
  final String _name = 'Fantasy';

  Fantasy(subcategoryPref) {
    activeSubcategory = subcategoryPref;
  }

  @override
  String icon = 'assets/icons/svg/book.svg';

  @override
  int activeSubcategory = 0;

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
