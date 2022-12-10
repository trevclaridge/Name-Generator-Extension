part of model;

class PanelPrefs {
  late int panelNum;
  int numSyllables = 2;

  PanelPrefs({this.numSyllables = 2, required this.panelNum});

  set setNumSyllables(int newNumSylls) {
    numSyllables = newNumSylls;
  }

  PanelPrefs.fromPrefs(List<String> prefs) {
    panelNum = int.parse(prefs.elementAt(0));
    numSyllables = int.parse(prefs.elementAt(1));
  }

  List<String> prefsAsStringList() {
    List<String> prefs = [];

    prefs.add(numSyllables.toString());
    return prefs;
  }
}
