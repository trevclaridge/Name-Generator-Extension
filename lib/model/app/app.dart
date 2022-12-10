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

  void addNameToSaved(FullName fullname) {
    _savedNames.add(fullname);
    SharedPrefs().saveNameListToPrefs();
    print(_savedNames);
  }

  void populateSavedNames() {
    SharedPrefs().getNameListFromPrefs();
  }
}
