// ignore_for_file: constant_identifier_names

part of tavern;

// class Tavern implements Subcategory {
//   final String _subcategory;
//   const Tavern._(this._subcategory);

//   @override
//   String toString() {
//     return _subcategory;
//   }

//   static const Tavern fantasy = Tavern._('fantasy');
// }

class Tavern implements Category {
  final String _name = 'Tavern';

  Tavern(subcategoryPref) {
    activeSubcategory = subcategoryPref;
  }

  // @override
  // IconData icon = FontAwesomeIcons.beerMugEmpty;

  @override
  AssetImage icon = const AssetImage('lib/assets/icons/png/saloon.png');

  @override
  int activeSubcategory = 0;

  @override
  List<Subcategory> subcategories = [FantasyTavern()];

  @override
  List<Subcategory> getSubcategories() {
    return subcategories;
  }

  @override
  Subcategory parse(String subcategoryPref) {
    Subcategory tempSubcategory = FantasyTavern();
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
