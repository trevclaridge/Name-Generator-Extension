part of model;

class SharedPrefs {
  //Singleton pattern
  static final SharedPrefs _data = SharedPrefs._internal();
  factory SharedPrefs() {
    return _data;
  }
  SharedPrefs._internal();

  Future<bool> getFirstOpen() async {
    final prefs = await SharedPreferences.getInstance();

    bool? isFO = prefs.getBool('is_first_open');
    return isFO ?? true;
  }

  Future<void> getNameListFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    final List<String>? names = prefs.getStringList('saved_names');

    if (names != null) {
      for (var name in names) {
        App().addNameToSaved(SavedName.fromPrefs(name));
      }
    }
  }

  Future<void> getPanelSettingsFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    for (int i = 0; i < 5; ++i) {
      String key = 'panel_setting_$i';
      String? panelSetting = prefs.getString(key);

      App().panelNames[i].panelSettings =
          PanelSettings.fromPrefs(panelSetting!);
    }
  }

  Future<void> setFirstOpen() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('is_first_open', false);
  }

  Future<void> saveNameListToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    List<SavedName> savedFullNameObjects = App().savedNames;
    List<String> fullNamesAsStrings = [];

    for (SavedName name in savedFullNameObjects) {
      fullNamesAsStrings.add(name.name);
    }

    await prefs.setStringList('saved_names', fullNamesAsStrings);
  }

  Future<void> savePanelSettingsToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    // print(App().panelNames[0].panelSettings.toJsonString());
    // print(App().panelNames[1].panelSettings.toJsonString());
    // print(App().panelNames[2].panelSettings.toJsonString());
    // print(App().panelNames[3].panelSettings.toJsonString());
    // print(App().panelNames[4].panelSettings.toJsonString());

    for (int i = 0; i < 5; ++i) {
      // ignore: unused_local_variable
      await prefs.setString(
          'panel_setting_$i', App().panelNames[i].panelSettings.toJsonString());
    }
  }
}
