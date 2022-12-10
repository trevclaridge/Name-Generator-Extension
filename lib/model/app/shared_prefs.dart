part of model;

class SharedPrefs {
  //Singleton pattern
  static final SharedPrefs _data = SharedPrefs._internal();
  factory SharedPrefs() {
    return _data;
  }
  SharedPrefs._internal();

  Future<void> saveNameListToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    List<FullName> savedFullNameObjects = App().savedNames;
    List<String> fullNamesAsStrings = [];

    for (FullName name in savedFullNameObjects) {
      fullNamesAsStrings.add(name.getCombinedName());
    }

    await prefs.setStringList('saved_names', fullNamesAsStrings);
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
}
