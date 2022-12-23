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
  final String _name = 'Town';

  Town(subcategoryPref) {
    activeSubcategory = subcategoryPref;
  }

  // @override
  // IconData icon = FontAwesomeIcons.towerBroadcast;

  @override
  String icon = 'lib/assets/icons/svg/village.svg';

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
