part of model;

class PanelSettings {
  // late int panelNum;
  late int numSyllables;
  late Category toggleCategory;
  late Gender toggleGender;

  PanelSettings(
      {required this.numSyllables,
      // required this.panelNum,
      required this.toggleCategory,
      required this.toggleGender});

  set setNumSyllables(int newNumSylls) {
    numSyllables = newNumSylls;
  }

  PanelSettings.fromPrefs(List<String> panelSettings) {
    // panelNum = int.parse(panelSettings.elementAt(0));
    numSyllables = int.parse(panelSettings.elementAt(0));
    toggleCategory =
        EnumToString.fromString(Category.values, panelSettings.elementAt(1))!;
    toggleGender =
        EnumToString.fromString(Gender.values, panelSettings.elementAt(2))!;
  }

  List<String> prefsAsStringList() {
    List<String> panelSettings = [];

    // panelSettings.add(panelNum.toString());
    panelSettings.add(numSyllables.toString());
    panelSettings.add(EnumToString.convertToString(toggleCategory));
    panelSettings.add(EnumToString.convertToString(toggleGender));
    return panelSettings;
  }
}
