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
    CustomTheme().purpleTheme: 'purple',
  };

  void changeUserTheme(ThemeData theme) {
    userTheme = theme;
    JavascriptController().changeIcon(themeMap[theme]!);
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

  void populateUserSettings() {
    SharedPrefs().getUserSettingsFromPrefs();
  }

  void populateUserSettingsFromPrefString(String prefString) {
    final json = jsonDecode(prefString);
    String tempString = json['show_dice_roller']; // prevents no such method
    showDiceRoller = tempString.parseBool();
    userTheme = decodeThemeFromString(json['color_theme']);
  }

  String toJsonString() {
    Map<String, dynamic> json = {
      'show_dice_roller': showDiceRoller.toString(),
      'color_theme': themeMap[userTheme]
    };
    return jsonEncode(json);
  }

  void toggleDiceRoller() {
    showDiceRoller = !showDiceRoller;
    saveUserSettingsToPrefs();

    notifyListeners();
  }
}
