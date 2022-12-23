part of model;

class PanelSettings {
  int numSyllables = 2;
  int activeCategoryIndex = 2;
  List<Category> categories = Categories().categories;
  Gender activeGender = Gender.genderNeutral;

  PanelSettings(
      {required this.numSyllables,
      required this.activeCategoryIndex,
      required this.categories,
      required this.activeGender});

  set setNumSyllables(int newNumSylls) {
    numSyllables = newNumSylls;
  }

  factory PanelSettings.fromPrefs(String settings) {
    final json = jsonDecode(settings);
    List<dynamic> subcategoriesPref = json['subcategories'];
    for (int i = 0; i < subcategoriesPref.length; ++i) {
      subcategoriesPref[i] = subcategoriesPref[i];
    }

    List<Category> appCategories = Categories().categories;
    for (int i = 0; i < appCategories.length; ++i) {
      appCategories[i].activeSubcategory = int.parse(subcategoriesPref[i]);
    }

    return PanelSettings(
        numSyllables: int.parse(json['numSyllables']),
        activeCategoryIndex: int.parse(json['activeCategoryIndex']),
        activeGender:
            EnumToString.fromString(Gender.values, json['activeGender'])!,
        categories: appCategories);
  }

  String toJsonString() {
    List<String> subcategories = [];
    for (int i = 0; i < categories.length; ++i) {
      subcategories.add(categories[i].activeSubcategory.toString());
    }
    Map<String, dynamic> json = {
      'numSyllables': numSyllables.toString(),
      'activeCategoryIndex': activeCategoryIndex.toString(),
      'activeGender': EnumToString.convertToString(activeGender),
      'subcategories': subcategories
    };

    return jsonEncode(json);
  }
}
