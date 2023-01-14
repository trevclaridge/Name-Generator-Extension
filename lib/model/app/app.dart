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

  final List<Name> panelNames = [
    Name(),
    Name(),
    Name(),
    Name(),
    Name(),
  ];

  PageController appPageController = PageController();

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
    if (panelNames[panelNum].panelSettings.numSyllables <
        Constants.MIN_NUM_SYLLABLES) {
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

    if (panelNames[panelNum].panelSettings.numSyllables >
        Constants.MAX_NUM_SYLLABLES) {
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

  void toggleSubcategoryPanelButton(int panelNum, int subCategoryIndex) {
    var categoryIndex =
        App().panelNames[panelNum].panelSettings.activeCategoryIndex;

    App()
        .panelNames[panelNum]
        .panelSettings
        .categories[categoryIndex]
        .activeSubcategory = subCategoryIndex;

    rerollName(panelNum);
    saveSettingstoPrefs();
    notifyListeners();
  }

  void toggleCategoryPanelButton(int panelNum, int toggle) {
    App().panelNames[panelNum].panelSettings.activeCategoryIndex = toggle;

    rerollName(panelNum);
    saveSettingstoPrefs();
    notifyListeners();
  }

  void toggleGenderPanelButton(int panelNum, Gender gender) {
    App().panelNames[panelNum].panelSettings.activeGender = gender;
    rerollName(panelNum);
    saveSettingstoPrefs();
    notifyListeners();
  }
}
