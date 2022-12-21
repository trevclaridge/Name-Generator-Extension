part of model;

class PanelSettings {
  int numSyllables = 2;
  Category activeCategory = Fantasy(Elf().getName());
  List<Category> categories = allCategories;
  Gender activeGender = Gender.genderNeutral;

  PanelSettings(
      {required this.numSyllables,
      required this.activeCategory,
      required this.categories,
      required this.activeGender});

  set setNumSyllables(int newNumSylls) {
    numSyllables = newNumSylls;
  }

  factory PanelSettings.fromPrefs(String settings) {
    final json = jsonDecode(settings);
    List<dynamic> subcategoriesPref = json['subcategories'];
    for (int i = 0; i < subcategoriesPref.length; ++i) {
      subcategoriesPref[i] = subcategoriesPref[i].toString();
    }
    List<Category> appCategories = App().allCategories;
    for (int i = 0; i < appCategories.length; ++i) {
      appCategories[i].activeSubcategory =
          appCategories[i].parse(subcategoriesPref[i]);
    }

    Category category = Fantasy(Elf().toString());
    for (var appCategory in App().allCategories) {
      if (json['activeCategory'] == appCategory.getName()) {
        category = appCategory;
      }
    }
    return PanelSettings(
        numSyllables: int.parse(json['numSyllables']),
        activeCategory: category,
        activeGender:
            EnumToString.fromString(Gender.values, json['activeGender'])!,
        categories: appCategories);
  }

  String toJsonString() {
    List<String> subcategories = [];
    for (int i = 0; i < categories.length; ++i) {
      subcategories.add(categories[i].activeSubcategory.getName());
    }
    Map<String, dynamic> json = {
      'numSyllables': numSyllables.toString(),
      'activeCategory': activeCategory.getName(),
      'activeGender': EnumToString.convertToString(activeGender),
      'subcategories': subcategories
    };

    return jsonEncode(json);
  }
}

List<Category> allCategories = [
  Chaos(BlipBlorp().getName()),
  Fantasy(Human().getName()),
  Pirate(Sailor().getName()),
  Tavern(FantasyTavern().getName()),
  Town(RealTown().getName())
];
