part of model;

class SharedPrefs {
  //Singleton pattern
  static final SharedPrefs _data = SharedPrefs._internal();
  factory SharedPrefs() {
    return _data;
  }
  SharedPrefs._internal();

  Future<void> getFirstOpen() async {
    final prefs = await SharedPreferences.getInstance();

    bool? isFO = prefs.getBool('is_first_open');

    if (isFO != null) {
      App().isFirstOpen = isFO;
    }
  }

  Future<void> getNameListFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    final List<String>? names = prefs.getStringList('saved_names');

    if (names != null) {
      for (var name in names) {
        App().addNameToSaved(FullName.fromPrefs(name));
      }
    }
  }

  Future<void> getPanelSettingsFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    for (int i = 0; i < 5; ++i) {
      List<String>? panelSetting = prefs.getStringList('panel_pref_$i');
      if (panelSetting == null) {
        print('panelSetting $i was null');
      }
      App().panelSettings[i] = PanelSettings.fromPrefs(panelSetting!);
    }
  }

  Future<void> setFirstOpen() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('is_first_open', false);
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

  Future<void> savePanelSettingsToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    List<PanelSettings> panelPrefs = App().panelSettings;

    for (int i = 0; i < 5; ++i) {
      await prefs.setStringList(
          'panel_pref_$i', panelPrefs[i].prefsAsStringList());
    }
  }
}
