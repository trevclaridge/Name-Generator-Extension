part of model;

class UserSettings extends ChangeNotifier {
  //Singleton pattern
  static final UserSettings _data = UserSettings._internal();
  factory UserSettings() {
    return _data;
  }
  UserSettings._internal();

  bool showDiceRoller = false;
  ThemeData userTheme = CustomTheme().orangeTheme;

  final Map<ThemeData, String> themeMap = {
    CustomTheme().orangeTheme: 'orange',
    CustomTheme().blueTheme: 'blue',
    CustomTheme().greenTheme: 'green',
  };

  void changeUserTheme(ThemeData theme) {
    userTheme = theme;
    saveUserSettingsToPrefs();
    notifyListeners();
  }

  ThemeData decodeThemeFromString(String themeString) {
    return themeMap.keys.firstWhere((k) => themeMap[k] == themeString,
        orElse: () => CustomTheme().orangeTheme);
  }

  void saveUserSettingsToPrefs() {
    SharedPrefs().saveUserSettingsToPrefs();
  }

  void toggleDiceRoller() {
    showDiceRoller = !showDiceRoller;
    notifyListeners();
  }
}
