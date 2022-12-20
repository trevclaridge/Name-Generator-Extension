// ignore_for_file: constant_identifier_names

part of pirate;

// class Pirate implements Subcategory {
//   final String _subcategory;
//   const Pirate._(this._subcategory);

//   @override
//   String toString() {
//     return _subcategory;
//   }

//   static const Pirate sailor = Pirate._('sailor');
//   static const Pirate ship = Pirate._('ship');
// }

class Pirate implements Category {
  Pirate(subcategoryPref) {
    activeSubcategory = parse(subcategoryPref);
  }

  @override
  IconData icon = FontAwesomeIcons.earthOceania;

  @override
  Subcategory activeSubcategory = Sailor();

  @override
  List<Subcategory> subcategories = [Sailor(), Ship()];

  @override
  List<Subcategory> getSubcategories() {
    return subcategories;
  }

  Subcategory parse(String subcategoryPref) {
    Subcategory tempSubcategory = Sailor();
    for (Subcategory subcategory in subcategories) {
      if (subcategoryPref == subcategory.toString()) {
        tempSubcategory = subcategory;
      }
    }
    return tempSubcategory;
  }
}
