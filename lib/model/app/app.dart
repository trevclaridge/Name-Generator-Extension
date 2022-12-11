part of model;

class App {
  //Singleton pattern
  static final App _data = App._internal();
  factory App() {
    return _data;
  }
  App._internal();

  final List<FullName> _savedNames = [];
  List<FullName> get savedNames => _savedNames;

  final List<PanelPrefs> panelPrefs = [
    PanelPrefs(panelNum: 0, numSyllables: 1),
    PanelPrefs(panelNum: 1, numSyllables: 2),
    PanelPrefs(panelNum: 2, numSyllables: 3),
    PanelPrefs(panelNum: 3, numSyllables: 4),
    PanelPrefs(panelNum: 4, numSyllables: 5)
  ];

  void addNameToSaved(FullName fullname) {
    if (!_savedNames.contains(fullname)) {
      _savedNames.add(fullname);
      SharedPrefs().saveNameListToPrefs();
    }
  }

  void savePrefstoPrefs() {
    SharedPrefs().saveNamePanelPrefs();
  }

  void deleteNameFromSaved(FullName fullname) {
    _savedNames.remove(fullname);
    SharedPrefs().saveNameListToPrefs();
  }

  void populateSavedNames() {
    SharedPrefs().getNameListFromPrefs();
  }

  void populatePanelPrefs() {
    SharedPrefs().getPanelPrefsFromPrefs();

    if (panelPrefs == []) {
      for (int i = 0; i < 4; ++i) {
        panelPrefs[i] = PanelPrefs(numSyllables: 2, panelNum: i);
      }
    }
  }
}
