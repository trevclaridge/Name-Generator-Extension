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

  final List<PanelSettings> panelSettings = [
    PanelSettings(panelNum: 0, numSyllables: 1),
    PanelSettings(panelNum: 1, numSyllables: 2),
    PanelSettings(panelNum: 2, numSyllables: 3),
    PanelSettings(panelNum: 3, numSyllables: 4),
    PanelSettings(panelNum: 4, numSyllables: 5)
  ];

  final List<FullName> panelNames = [
    FullName(FirstName.numSylls(1), LastName.numSylls(1)),
    FullName(FirstName.numSylls(2), LastName.numSylls(2)),
    FullName(FirstName.numSylls(3), LastName.numSylls(3)),
    FullName(FirstName.numSylls(4), LastName.numSylls(4)),
    FullName(FirstName.numSylls(5), LastName.numSylls(5))
  ];

  void addNameToSaved(FullName fullname) {
    if (!_savedNames.contains(fullname)) {
      _savedNames.add(fullname);
      SharedPrefs().saveNameListToPrefs();
    }
  }

  bool checkFirstOpen() {
    SharedPrefs().getFirstOpen();
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
  }

  void incrementSyllables(int panelNum) {
    ++panelSettings[panelNum].numSyllables;

    if (panelSettings[panelNum].numSyllables > 6) {
      decrementSyllables(panelNum);
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

  void initializeApp() {
    SharedPrefs().setFirstOpen();
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

  void saveSettingstoPrefs() {
    SharedPrefs().savePanelSettingsToPrefs();
  }
}
