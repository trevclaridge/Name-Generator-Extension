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

  final List<String> _categories = [
    'town',
    'dragon',
    'pirate',
    'medieval',
    'tavern'
  ];
  final List<String> _gendered = [
    'genderneutral',
    'masculine',
    'feminine',
  ];

  final List<String> genderNeutralCategories = [
    'tavern',
    'dragon',
    'town',
  ];

  final List<PanelSettings> panelSettings = [
    PanelSettings(
      panelNum: 0,
      numSyllables: 1,
      toggles: 'genderneutralpirate',
    ),
    PanelSettings(
      panelNum: 1,
      numSyllables: 2,
      toggles: 'femininepirate',
    ),
    PanelSettings(
      panelNum: 2,
      numSyllables: 3,
      toggles: 'genderneutraltown',
    ),
    PanelSettings(
      panelNum: 3,
      numSyllables: 4,
      toggles: 'masculinedragonpirate',
    ),
    PanelSettings(
      panelNum: 4,
      numSyllables: 2,
      toggles: 'genderneutraltavern',
    )
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
    bool hasCategory = false;
    bool hasGender = false;

    // if the toggle is in the string, remove it, and vice versa
    if (panelSettings[panelNum].toggles.contains(toggle)) {
      var newToggle = panelSettings[panelNum].toggles.replaceAll(toggle, '');
      panelSettings[panelNum].toggles = newToggle;

      // ensure the string has a least one category
      for (var category in _categories) {
        if (newToggle.contains(category)) {
          hasCategory = true;
          break;
        }
      }

      // ensure the string has at least one gender preference
      for (var gender in _gendered) {
        if (newToggle.contains(gender)) {
          hasGender = true;
          break;
        }
      }

      // if neither category or gender preference, add toggle back
      if (!(hasCategory && hasGender)) {
        panelSettings[panelNum].toggles += toggle;
      }
    } else {
      panelSettings[panelNum].toggles += toggle;
    }

    // special combinations
    // towns, taverns, and dragons can't be gendered
    for (String item in genderNeutralCategories) {
      if (panelSettings[panelNum].toggles.contains(item)) {
        panelSettings[panelNum].toggles =
            panelSettings[panelNum].toggles.replaceAll('feminine', '');
        panelSettings[panelNum].toggles =
            panelSettings[panelNum].toggles.replaceAll('masculine', '');
        if (!(panelSettings[panelNum].toggles.contains('genderneutral'))) {
          panelSettings[panelNum].toggles += 'genderneutral';
        }
      }
    }
    print('After: ${panelSettings[panelNum].toggles}');

    saveSettingstoPrefs();
    notifyListeners();
  }
}
