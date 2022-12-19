part of model;

class App extends ChangeNotifier {
  //Singleton pattern
  static final App _data = App._internal();
  factory App() {
    return _data;
  }
  App._internal();

  bool isFirstOpen = true;

  final List<SavedName> _savedNames = [];
  List<SavedName> get savedNames => _savedNames;

  List<Category> nonGenderedCategores = [Category.tavern, Category.town];

  // final List<FullName> panelNames = [
  //   FullName(
  //       FirstName(),
  //       LastName(),
  //       PanelSettings(
  //           numSyllables: 2,
  //           toggleCategory: Category.fantasy,
  //           toggleGender: Gender.genderNeutral)),
  //   FullName(
  //       FirstName(),
  //       LastName(),
  //       PanelSettings(
  //           numSyllables: 3,
  //           toggleCategory: Category.pirate,
  //           toggleGender: Gender.feminine)),
  //   FullName(
  //       FirstName(),
  //       LastName(),
  //       PanelSettings(
  //           numSyllables: 4,
  //           toggleCategory: Category.tavern,
  //           toggleGender: Gender.masculine)),
  //   FullName(
  //       FirstName(),
  //       LastName(),
  //       PanelSettings(
  //           numSyllables: 5,
  //           toggleCategory: Category.town,
  //           toggleGender: Gender.feminine)),
  //   FullName(
  //       FirstName(),
  //       LastName(),
  //       PanelSettings(
  //           numSyllables: 6,
  //           toggleCategory: Category.dragon,
  //           toggleGender: Gender.genderNeutral))
  // ];

  final List<Name> panelNames = [
    Name(),
    Name(),
    Name(),
    Name(),
    Name(),
  ];

  void addNameToSaved(SavedName name) {
    if (!_savedNames.contains(name)) {
      _savedNames.add(name);
      SharedPrefs().saveNameListToPrefs();
    }
  }

  Future<bool> checkFirstOpen() async {
    bool isFO = await SharedPrefs().getFirstOpen();
    isFirstOpen = isFO;
    return isFirstOpen;
  }

  void decrementSyllables(int panelNum) {
    --panelNames[panelNum].panelSettings.numSyllables;
    if (panelNames[panelNum].panelSettings.numSyllables < 1) {
      incrementSyllables(panelNum);
    }
    saveSettingstoPrefs();

    panelNames[panelNum].generate(panelNames[panelNum].panelSettings);

    notifyListeners();
  }

  void deleteNameFromSaved(SavedName fullname) {
    _savedNames.remove(fullname);
    SharedPrefs().saveNameListToPrefs();
    notifyListeners();
  }

  void incrementSyllables(int panelNum) {
    ++panelNames[panelNum].panelSettings.numSyllables;

    if (panelNames[panelNum].panelSettings.numSyllables > 8) {
      decrementSyllables(panelNum);
    }
    saveSettingstoPrefs();
    rerollName(panelNum);
    notifyListeners();
  }

  void initializeApp() {
    SharedPrefs().setFirstOpen();
    saveSettingstoPrefs();
  }

  void populatePanelSettings() {
    SharedPrefs().getPanelSettingsFromPrefs();
  }

  void populateSavedNames() {
    SharedPrefs().getNameListFromPrefs();
  }

  void rerollNames() {
    for (int i = 0; i < 5; ++i) {
      panelNames[i].generate(panelNames[i].panelSettings);
    }
    notifyListeners();
  }

  void rerollName(int panelNum) {
    panelNames[panelNum].generate(panelNames[panelNum].panelSettings);
    // print(panelNames[panelNum].panelSettings.numSyllables);
    notifyListeners();
  }

  void saveSettingstoPrefs() {
    SharedPrefs().savePanelSettingsToPrefs();
  }

  void togglePanelButton(int panelNum, String toggle) {
    List<String> categories = EnumToString.toList(Category.values);
    List<String> subcategories = EnumToString.toList(Subcategories.values);

    if (categories.contains(toggle)) {
      App().panelNames[panelNum].panelSettings.toggleCategory =
          EnumToString.fromString(Category.values, toggle)!;
      if (nonGenderedCategores
          .contains(EnumToString.fromString(Category.values, toggle)!)) {
        App().panelNames[panelNum].panelSettings.toggleGender =
            Gender.genderNeutral;
      } else {
        App().panelNames[panelNum].panelSettings.toggleGender = Gender.feminine;
      }
    } else if (subcategories.contains(toggle)) {
      App().panelNames[panelNum].panelSettings.toggleSubcategories[
              getCategoryIndex(
                  App().panelNames[panelNum].panelSettings.toggleCategory)] =
          getSubcategory(
              App().panelNames[panelNum].panelSettings.toggleCategory, toggle);
    } else {
      App().panelNames[panelNum].panelSettings.toggleGender =
          EnumToString.fromString(Gender.values, toggle)!;
    }
    rerollName(panelNum);
    saveSettingstoPrefs();
    notifyListeners();
  }

  int getCategoryIndex(Category category) {
    int index = -1;
    switch (category) {
      case Category.town:
        index = 0;
        break;
      case Category.pirate:
        index = 1;
        break;
      case Category.fantasy:
        index = 2;
        break;
      case Category.tavern:
        index = 3;
        break;
      case Category.chaos:
        index = 4;
        break;
    }
    return index;
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
}
