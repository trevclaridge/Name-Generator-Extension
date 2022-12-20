part of model;

class PanelSettings {
  int numSyllables = 2;
  Category activeCategory = Fantasy(Elf().toString());
  List<Category> categories = App().allCategories;
  Gender activeGender = Gender.genderNeutral;

  PanelSettings(
      {required this.numSyllables,
      // required this.panelNum,
      required this.activeCategory,
      required this.categories,
      required this.activeGender});

  set setNumSyllables(int newNumSylls) {
    numSyllables = newNumSylls;
  }

  // PanelSettings.fromPrefs(String panelSettings) {
  //   final data = jsonDecode(panelSettings);
  //    PanelSettings.fromJSON(data);
  // }

  // PanelSettings.fromPrefs(String panelSettings)
  //     : this.fromJSON(jsonDecode(panelSettings));

  factory PanelSettings.fromPrefs(String settings) {
    final json = jsonDecode(settings);
    // print(json);
    // List<Subcategory> subcategories = [];
    // List<String> categories = EnumToString.toList(Category.values);
    // // print(categories);
    // for (var subcategory in json['toggleSubcategories'] as List) {
    //   for (String category in categories) {
    //     if (!subcategories.contains(getSubcategory(
    //         EnumToString.fromString(Category.values, category)!,
    //         subcategory))) {
    //       subcategories.add(getSubcategory(
    //           EnumToString.fromString(Category.values, category)!,
    //           subcategory));
    //     }
    //   }
    // }
    List<String> subcategoriesPref = json['subcategories'];
    List<Category> appCategories = App().allCategories;
    for (int i = 0; i < appCategories.length; ++i) {
      appCategories[i].activeSubcategory =
          appCategories[i].parse(subcategoriesPref[i].toString());
    }

    Category category = Fantasy(Elf());
    for (var appCategory in App().allCategories) {
      if (json['activeCategory'] == appCategory.toString()) {
        category = appCategory;
      }
    }
    // print(subcategories);
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
      subcategories.add(categories[i].activeSubcategory.toString());
    }
    Map<String, dynamic> json = {
      'numberSyllables': numSyllables,
      'activeCategory': activeCategory.toString(),
      'activeGender': EnumToString.convertToString(activeGender),
      'subcategories': subcategories
    };

    return jsonEncode(json);
  }

  // List<String> prefsAsStringList() {
  //   List<String> panelSettings = [];

  //   // panelSettings.add(panelNum.toString());
  //   panelSettings.add(numSyllables.toString());
  //   panelSettings.add(EnumToString.convertToString(toggleCategory));
  //   panelSettings.add(toggleSubcategories.toString());
  //   panelSettings.add(EnumToString.convertToString(toggleGender));
  //   return panelSettings;
  // }
}

// Subcategory getSubcategory(Category category, String subcategory) {
//   Subcategory tempCategory = Fantasy.human;
//   switch (category) {
//     case Category.town:
//       switch (subcategory) {
//         case 'real':
//           tempCategory = Town.real;
//           break;
//       }
//       break;
//     case Category.pirate:
//       switch (subcategory) {
//         case 'sailor':
//           tempCategory = Pirate.sailor;
//           break;
//         case 'ship':
//           tempCategory = Pirate.ship;
//           break;
//       }
//       break;
//     case Category.fantasy:
//       switch (subcategory) {
//         case 'elf':
//           tempCategory = Fantasy.elf;
//           break;
//         case 'dwarf':
//           tempCategory = Fantasy.dwarf;
//           break;
//         case 'human':
//           tempCategory = Fantasy.human;
//           break;
//       }
//       break;
//     case Category.tavern:
//       switch (subcategory) {
//         case 'fantasy':
//           tempCategory = Tavern.fantasy;
//           break;
//       }
//       break;
//     case Category.chaos:
//       switch (subcategory) {
//         case 'blipblorp':
//           tempCategory = Chaos.blipblorp;
//           break;
//       }
//       break;
//   }
//   return tempCategory;
// }
