part of model;

class PanelSettings {
  // late int panelNum;
  late int numSyllables;
  late Category toggleCategory;
  late List<Subcategory> toggleSubcategories;
  late Gender toggleGender;

  PanelSettings(
      {required this.numSyllables,
      // required this.panelNum,
      required this.toggleCategory,
      required this.toggleSubcategories,
      required this.toggleGender});

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
    List<Subcategory> subcategories = [];
    List<String> categories = EnumToString.toList(Category.values);
    for (var subcategory in json['toggleSubcategories'] as List) {
      for (String category in categories) {
        subcategories.add(getSubcategory(
            EnumToString.fromString(Category.values, category)!, subcategory));
      }
    }
    return PanelSettings(
        numSyllables: int.parse(json['numSyllables']),
        toggleCategory:
            EnumToString.fromString(Category.values, json['toggleCategory'])!,
        toggleGender:
            EnumToString.fromString(Gender.values, json['toggleGender'])!,
        toggleSubcategories: subcategories);
  }

  String toJsonString() {
    List<String> subcategories = [];
    for (int i = 0; i < toggleSubcategories.length; ++i) {
      subcategories.add(toggleSubcategories[i].toString());
    }
    Map<String, dynamic> json = {
      'numberSyllables': numSyllables,
      'toggleCategory': EnumToString.convertToString(toggleCategory),
      'toggleGender': EnumToString.convertToString(toggleGender),
      'toggleSubcategories': subcategories
    };

    return jsonEncode(json);
  }

  List<String> prefsAsStringList() {
    List<String> panelSettings = [];

    // panelSettings.add(panelNum.toString());
    panelSettings.add(numSyllables.toString());
    panelSettings.add(EnumToString.convertToString(toggleCategory));
    panelSettings.add(toggleSubcategories.toString());
    panelSettings.add(EnumToString.convertToString(toggleGender));
    return panelSettings;
  }
}

Subcategory getSubcategory(Category category, String subcategory) {
  Subcategory tempCategory = Fantasy.human;
  switch (category) {
    case Category.town:
      switch (subcategory) {
        case 'real':
          tempCategory = Town.real;
          break;
      }
      break;
    case Category.pirate:
      switch (subcategory) {
        case 'sailor':
          tempCategory = Pirate.sailor;
          break;
        case 'ship':
          tempCategory = Pirate.ship;
          break;
      }
      break;
    case Category.fantasy:
      switch (subcategory) {
        case 'elf':
          tempCategory = Fantasy.elf;
          break;
        case 'dwarf':
          tempCategory = Fantasy.dwarf;
          break;
        case 'human':
          tempCategory = Fantasy.human;
          break;
      }
      break;
    case Category.tavern:
      switch (subcategory) {
        case 'fantasy':
          tempCategory = Tavern.fantasy;
          break;
      }
      break;
    case Category.chaos:
      switch (subcategory) {
        case 'blipblorp':
          tempCategory = Chaos.blipblorp;
          break;
      }
      break;
  }
  return tempCategory;
}
