part of model;

class App extends ChangeNotifier {
  //Singleton pattern
  static final App _data = App._internal();
  factory App() {
    return _data;
  }
  App._internal();

  bool isFirstOpen = true;

  final List<FullName> _savedNames = [];
  List<FullName> get savedNames => _savedNames;

  List<Category> nonGenderedCategores = [
    Category.dragon,
    Category.tavern,
    Category.town
  ];

  final List<FullName> panelNames = [
    FullName(
        FirstName(),
        LastName(),
        PanelSettings(
            numSyllables: 2,
            toggleCategory: Category.medieval,
            toggleGender: Gender.genderNeutral)),
    FullName(
        FirstName(),
        LastName(),
        PanelSettings(
            numSyllables: 3,
            toggleCategory: Category.pirate,
            toggleGender: Gender.feminine)),
    FullName(
        FirstName(),
        LastName(),
        PanelSettings(
            numSyllables: 4,
            toggleCategory: Category.tavern,
            toggleGender: Gender.masculine)),
    FullName(
        FirstName(),
        LastName(),
        PanelSettings(
            numSyllables: 5,
            toggleCategory: Category.town,
            toggleGender: Gender.feminine)),
    FullName(
        FirstName(),
        LastName(),
        PanelSettings(
            numSyllables: 6,
            toggleCategory: Category.dragon,
            toggleGender: Gender.genderNeutral))
  ];

  void addNameToSaved(FullName fullname) {
    if (!_savedNames.contains(fullname)) {
      _savedNames.add(fullname);
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

    panelNames[panelNum].firstName.generate(panelNames[panelNum].panelSettings);
    panelNames[panelNum].lastName.generate(panelNames[panelNum].panelSettings);

    notifyListeners();
  }

  void deleteNameFromSaved(FullName fullname) {
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
      panelNames[i].firstName.generate(panelNames[i].panelSettings);
      panelNames[i].lastName.generate(panelNames[i].panelSettings);
    }
    notifyListeners();
  }

  void rerollName(int panelNum) {
    panelNames[panelNum].rerollName();
    // print(panelNames[panelNum].panelSettings.numSyllables);
    notifyListeners();
  }

  void saveSettingstoPrefs() {
    SharedPrefs().savePanelSettingsToPrefs();
  }

  void togglePanelButton(int panelNum, String toggle) {
    List<String> categories = EnumToString.toList(Category.values);

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
    } else {
      App().panelNames[panelNum].panelSettings.toggleGender =
          EnumToString.fromString(Gender.values, toggle)!;
    }
    rerollName(panelNum);
    saveSettingstoPrefs();
    notifyListeners();
  }
}
