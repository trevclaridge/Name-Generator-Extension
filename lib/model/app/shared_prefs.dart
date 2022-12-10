part of model;

class SharedPrefs {
  //Singleton pattern
  static final SharedPrefs _data = SharedPrefs._internal();
  factory SharedPrefs() {
    return _data;
  }
  SharedPrefs._internal();

  Future<void> getNameListFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    final List<String>? names = prefs.getStringList('saved_names');

    if (names != null) {
      for (var name in names) {
        App().addNameToSaved(FullName.fromPrefs(name));
      }
    }
  }

  Future<void> getPanelPrefsFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    for (int i = 0; i < 4; ++i) {
      List<String>? panelPrefs = prefs.getStringList('panel_pref_$i');
      App().panelPrefs.add(PanelPrefs.fromPrefs(panelPrefs!));
    }
  }

  Future<void> saveNameListToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    List<FullName> savedFullNameObjects = App().savedNames;
    List<String> fullNamesAsStrings = [];

    for (FullName name in savedFullNameObjects) {
      fullNamesAsStrings.add(name.getCombinedName());
    }

    await prefs.setStringList('saved_names', fullNamesAsStrings);
  }

  Future<void> saveNamePanelPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    List<PanelPrefs> panelPrefs = App().panelPrefs;

    for (int i = 0; i < 5; ++i) {
      await prefs.setStringList(
          'panel_pref_$i', panelPrefs.elementAt(i).prefsAsStringList());
    }
  }
}
