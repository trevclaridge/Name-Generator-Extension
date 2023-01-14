// ignore_for_file: constant_identifier_names

part of town;

class Town implements Category {
  final String _name = 'Town';

  Town(subcategoryPref) {
    activeSubcategory = subcategoryPref;
  }

  @override
  String icon = 'assets/icons/svg/village.svg';

  @override
  int activeSubcategory = 0;

  @override
  List<Subcategory> subcategories = [RealTown(), FantasyTown()];

  @override
  List<Subcategory> getSubcategories() {
    return subcategories;
  }

  @override
  Subcategory parse(String subcategoryPref) {
    Subcategory tempSubcategory = RealTown();
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
