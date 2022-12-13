part of model;

class PanelSettings {
  late int panelNum;
  int numSyllables = 2;

  PanelSettings({this.numSyllables = 2, required this.panelNum});

  set setNumSyllables(int newNumSylls) {
    numSyllables = newNumSylls;
  }

  PanelSettings.fromPrefs(List<String> panelSettings) {
    panelNum = int.parse(panelSettings.elementAt(0));
    numSyllables = int.parse(panelSettings.elementAt(1));
  }

  List<String> prefsAsStringList() {
    List<String> panelSettings = [];

    panelSettings.add(panelNum.toString());
    panelSettings.add(numSyllables.toString());
    return panelSettings;
  }
}
