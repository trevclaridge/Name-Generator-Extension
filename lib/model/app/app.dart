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

  final _panelPrefs = List<PanelPrefs>.generate(
      5, (i) => PanelPrefs(panelNum: i, numSyllables: 2));
  List<PanelPrefs> get panelPrefs => _panelPrefs;

  void addNameToSaved(FullName fullname) {
    if (!_savedNames.contains(fullname)) {
      _savedNames.add(fullname);
      SharedPrefs().saveNameListToPrefs();
    }
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

    // if (_panelPrefs == []) {
    //   for (int i = 0; i < 4; ++i) {
    //     _panelPrefs.elementAt(i) = PanelPrefs(numSyllables: 2);
    //   }
    // }
  }
}
