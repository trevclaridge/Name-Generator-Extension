part of model;

class PanelSettings {
  late int panelNum;
  int numSyllables = 2;
  late Category toggleCategory;
  late Gender toggleGender;

  PanelSettings(
      {this.numSyllables = 2,
      required this.panelNum,
      required this.toggleCategory,
      required this.toggleGender});

  set setNumSyllables(int newNumSylls) {
    numSyllables = newNumSylls;
  }

  PanelSettings.fromPrefs(List<String> panelSettings) {
    panelNum = int.parse(panelSettings.elementAt(0));
    numSyllables = int.parse(panelSettings.elementAt(1));
    toggleCategory =
        EnumToString.fromString(Category.values, panelSettings.elementAt(2))!;
    toggleGender =
        EnumToString.fromString(Gender.values, panelSettings.elementAt(3))!;
  }

  List<String> prefsAsStringList() {
    List<String> panelSettings = [];

    panelSettings.add(panelNum.toString());
    panelSettings.add(numSyllables.toString());
    panelSettings.add(EnumToString.convertToString(toggleCategory));
    panelSettings.add(EnumToString.convertToString(toggleGender));
    return panelSettings;
  }
}
