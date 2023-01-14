part of pirate;

class Pirate implements Category {
  final String _name = 'Pirate';

  Pirate(subcategoryPref) {
    activeSubcategory = subcategoryPref;
  }

  @override
  String icon = 'assets/icons/svg/skull_crossbones.svg';

  @override
  int activeSubcategory = 0;

  @override
  List<Subcategory> subcategories = [Sailor(), Ship()];

  @override
  List<Subcategory> getSubcategories() {
    return subcategories;
  }

  @override
  Subcategory parse(String subcategoryPref) {
    Subcategory tempSubcategory = Sailor();
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
