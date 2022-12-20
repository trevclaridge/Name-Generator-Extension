// ignore_for_file: constant_identifier_names

part of town;

// class Town implements Subcategory {
//   final String _subcategory;
//   const Town._(this._subcategory);

//   @override
//   String toString() {
//     return _subcategory;
//   }

//   static const Town real = Town._('real');
// }

class Town implements Category {
  Town(subcategoryPref) {
    activeSubcategory = parse(subcategoryPref);
  }

  @override
  IconData icon = FontAwesomeIcons.towerBroadcast;

  @override
  Subcategory activeSubcategory = RealTown();

  @override
  List<Subcategory> subcategories = [RealTown(), FantasyTown()];

  @override
  List<Subcategory> getSubcategories() {
    return subcategories;
  }

  Subcategory parse(String subcategoryPref) {
    Subcategory tempSubcategory = RealTown();
    for (Subcategory subcategory in subcategories) {
      if (subcategoryPref == subcategory.toString()) {
        tempSubcategory = subcategory;
      }
    }
    return tempSubcategory;
  }
}
