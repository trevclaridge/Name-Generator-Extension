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
  final String _name = 'Chaos';

  Chaos(subcategoryPref) {
    activeSubcategory = subcategoryPref;
  }
  @override
  IconData icon = FontAwesomeIcons.fantasyFlightGames;

  @override
  int activeSubcategory = 0;

  @override
  List<Subcategory> subcategories = [BlipBlorp()];

  @override
  List<Subcategory> getSubcategories() {
    return subcategories;
  }

  @override
  Subcategory parse(String subcategoryPref) {
    Subcategory tempSubcategory = BlipBlorp();
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
