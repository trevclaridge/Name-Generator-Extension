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
  final String _name = 'Pirate';

  Pirate(subcategoryPref) {
    activeSubcategory = subcategoryPref;
  }

  @override
  IconData icon = FontAwesomeIcons.earthOceania;

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
