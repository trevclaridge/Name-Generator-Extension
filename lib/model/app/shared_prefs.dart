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

    bool? isFO = prefs.getBool('nge_is_first_open');
    return isFO ?? true;
  }

  Future<void> getNameListFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    final List<String>? names = prefs.getStringList('nge_saved_names');
    if (names != null) {
      var reversedList = names.reversed.toList();
      for (var name in reversedList) {
        App().addNameToSaved(SavedName.fromPrefs(name));
      }
    }
  }

  Future<void> getPanelSettingsFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    for (int i = 0; i < 5; ++i) {
      String key = 'nge_panel_setting_$i';
      String? panelSetting = prefs.getString(key);

      App().panelNames[i].panelSettings =
          PanelSettings.fromPrefs(panelSetting!);
    }
  }

  Future<void> setFirstOpen() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('nge_is_first_open', false);
  }

  Future<void> saveNameListToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedNamesAsStrings = [];

    for (SavedName name in App().savedNames) {
      savedNamesAsStrings.add(name.toJsonString());
    }

    await prefs.setStringList('nge_saved_names', savedNamesAsStrings);
  }

  Future<void> savePanelSettingsToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < 5; ++i) {
      await prefs.setString(
        'nge_panel_setting_$i',
        App().panelNames[i].panelSettings.toJsonString(),
      );
    }
  }

  Future<void> saveUserSettingsToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> json = {
      'show_dice_roller': UserSettings().showDiceRoller.toString(),
      'color_theme': UserSettings().themeMap[UserSettings().userTheme]
    };
    await prefs.setString('nge_user_settings', jsonEncode(json));
  }
}
