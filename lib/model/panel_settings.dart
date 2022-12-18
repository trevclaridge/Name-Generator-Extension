part of model;

class PanelSettings {
  late int panelNum;
  int numSyllables = 2;
  String toggles = '';

  PanelSettings(
      {this.numSyllables = 2, required this.panelNum, required this.toggles});

  set setNumSyllables(int newNumSylls) {
    numSyllables = newNumSylls;
  }

  PanelSettings.fromPrefs(List<String> panelSettings) {
    panelNum = int.parse(panelSettings.elementAt(0));
    numSyllables = int.parse(panelSettings.elementAt(1));
    toggles = panelSettings.elementAt(2);
  }

  List<String> prefsAsStringList() {
    List<String> panelSettings = [];

    panelSettings.add(panelNum.toString());
    panelSettings.add(numSyllables.toString());
    panelSettings.add(toggles);
    return panelSettings;
  }
}
