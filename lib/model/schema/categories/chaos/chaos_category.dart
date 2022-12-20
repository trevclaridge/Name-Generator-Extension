// ignore_for_file: constant_identifier_names

part of chaos;

// class Chaos implements Subcategory {
//   final String _subcategory;
//   const Chaos._(this._subcategory);

//   @override
//   String toString() {
//     return _subcategory;
//   }

//   static const Chaos blipblorp = Chaos._('blipblorp');
// }

class Chaos implements Category {
  Chaos(subcategoryPref) {
    activeSubcategory = parse(subcategoryPref);
  }
  @override
  IconData icon = FontAwesomeIcons.fantasyFlightGames;

  @override
  Subcategory activeSubcategory = BlipBlorp();

  @override
  List<Subcategory> subcategories = [BlipBlorp()];

  @override
  List<Subcategory> getSubcategories() {
    return subcategories;
  }

  Subcategory parse(String subcategoryPref) {
    Subcategory tempSubcategory = BlipBlorp();
    for (Subcategory subcategory in subcategories) {
      if (subcategoryPref == subcategory.toString()) {
        tempSubcategory = subcategory;
      }
    }
    return tempSubcategory;
  }
}
