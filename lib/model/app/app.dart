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

  final List<PanelSettings> panelSettings = [
    PanelSettings(
        panelNum: 0,
        numSyllables: 1,
        toggleCategory: Category.medieval,
        toggleGender: Gender.genderNeutral),
    PanelSettings(
        panelNum: 1,
        numSyllables: 2,
        toggleCategory: Category.pirate,
        toggleGender: Gender.feminine),
    PanelSettings(
        panelNum: 2,
        numSyllables: 3,
        toggleCategory: Category.tavern,
        toggleGender: Gender.genderNeutral),
    PanelSettings(
        panelNum: 3,
        numSyllables: 4,
        toggleCategory: Category.dragon,
        toggleGender: Gender.genderNeutral),
    PanelSettings(
        panelNum: 4,
        numSyllables: 2,
        toggleCategory: Category.town,
        toggleGender: Gender.genderNeutral)
  ];

  final List<FullName> panelNames = [
    FullName(FirstName.numSylls(1), LastName.numSylls(1)),
    FullName(FirstName.numSylls(2), LastName.numSylls(2)),
    FullName(FirstName.numSylls(3), LastName.numSylls(3)),
    FullName(FirstName.numSylls(4), LastName.numSylls(4)),
    FullName(FirstName.numSylls(5), LastName.numSylls(2))
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
    --panelSettings[panelNum].numSyllables;
    if (panelSettings[panelNum].numSyllables < 1) {
      incrementSyllables(panelNum);
    }
    saveSettingstoPrefs();

    panelNames[panelNum]
        .firstName
        .generate(panelSettings[panelNum].numSyllables);
    panelNames[panelNum]
        .lastName
        .generate(panelSettings[panelNum].numSyllables);

    notifyListeners();
  }

  void deleteNameFromSaved(FullName fullname) {
    _savedNames.remove(fullname);
    SharedPrefs().saveNameListToPrefs();
    notifyListeners();
  }

  void incrementSyllables(int panelNum) {
    ++panelSettings[panelNum].numSyllables;

    if (panelSettings[panelNum].numSyllables > 8) {
      decrementSyllables(panelNum);
    }
    saveSettingstoPrefs();
    rerollName(panelNum);
    notifyListeners();
  }

  void initializeApp() {
    SharedPrefs().setFirstOpen();
    // print(isFirstOpen);
    saveSettingstoPrefs();
  }

  void populatePanelSettings() {
    SharedPrefs().getPanelSettingsFromPrefs();

    // if (panelSettings.contains([])) {
    //   for (int i = 0; i < 5; ++i) {
    //     panelSettings[i] = PanelSettings(numSyllables: 2, panelNum: i);
    //   }
    // }
  }

  void populateSavedNames() {
    SharedPrefs().getNameListFromPrefs();
  }

  void rerollNames() {
    for (int i = 0; i < 5; ++i) {
      panelNames[i].firstName.generate(panelSettings[i].numSyllables);
      panelNames[i].lastName.generate(panelSettings[i].numSyllables);
    }
    notifyListeners();
  }

  void rerollName(int panelNum) {
    panelNames[panelNum].rerollName(panelSettings[panelNum].numSyllables);
    notifyListeners();
  }

  void saveSettingstoPrefs() {
    SharedPrefs().savePanelSettingsToPrefs();
  }

  void togglePanelButton(int panelNum, String toggle) {
    List<String> categories = EnumToString.toList(Category.values);

    if (categories.contains(toggle)) {
      App().panelSettings[panelNum].toggleCategory =
          EnumToString.fromString(Category.values, toggle)!;
      if (nonGenderedCategores
          .contains(EnumToString.fromString(Category.values, toggle)!)) {
        App().panelSettings[panelNum].toggleGender = Gender.genderNeutral;
      } else {
        App().panelSettings[panelNum].toggleGender = Gender.feminine;
      }
    } else {
      App().panelSettings[panelNum].toggleGender =
          EnumToString.fromString(Gender.values, toggle)!;
    }
    saveSettingstoPrefs();
    notifyListeners();
  }
}
