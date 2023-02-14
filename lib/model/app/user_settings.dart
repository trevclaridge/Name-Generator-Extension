part of model;

class UserSettings extends ChangeNotifier {
  //Singleton pattern
  static final UserSettings _data = UserSettings._internal();
  factory UserSettings() {
    return _data;
  }
  UserSettings._internal();

  bool showDiceRoller = false;

  void toggleDiceRoller() {
    showDiceRoller = !showDiceRoller;
    notifyListeners();
  }
}
