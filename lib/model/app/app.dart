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

  List<Category> nonGenderedCategores = [
    Tavern(FantasyTavern().getName()),
    Town(RealTown().getName())
  ];

  List<Category> allCategories = [
    Chaos(BlipBlorp().getName()),
    Fantasy(Human().getName()),
    Pirate(Sailor().getName()),
    Tavern(FantasyTavern().getName()),
    Town(RealTown().getName())
  ];

  final List<Name> panelNames = [
    Name(),
    Name(),
    Name(),
    Name(),
    Name(),
  ];

  void addNameToSaved(SavedName name) {
    for (var savedName in _savedNames) {
      if (name.name == savedName.name) {
        return;
      }
    }
    _savedNames.add(name);
    SharedPrefs().saveNameListToPrefs();
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
    notifyListeners();
  }

  void saveSettingstoPrefs() {
    SharedPrefs().savePanelSettingsToPrefs();
  }

  void toggleSubcategoryPanelButton(int panelNum, String toggle) {
    Category toggleCategory = Fantasy(Human().toString());
    final split = toggle.split(' ');

    for (var appCategory in App().allCategories) {
      if (split[0] == appCategory.getName()) {
        toggleCategory = appCategory;
      }
    }

    App()
        .panelNames[panelNum]
        .panelSettings
        .categories
        .singleWhere((element) => element.getName() == toggleCategory.getName(),
            orElse: () => Fantasy(Elf().getName()))
        .activeSubcategory = toggleCategory.parse(split[1]);

    App().panelNames[panelNum].panelSettings.activeCategory.activeSubcategory =
        toggleCategory.parse(split[1]);

    rerollName(panelNum);
    saveSettingstoPrefs();
    // notifyListeners();
  }

  void toggleCategoryPanelButton(int panelNum, String toggle) {
    for (var appCategory in App().allCategories) {
      if (toggle == appCategory.getName()) {
        App().panelNames[panelNum].panelSettings.activeCategory = appCategory;
      }
      rerollName(panelNum);
      saveSettingstoPrefs();
      notifyListeners();
    }
  }
}
