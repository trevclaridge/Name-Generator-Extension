part of model;

class FullName {
  late FirstName firstName;
  late LastName lastName;
  late PanelSettings panelSettings;

  FullName(this.firstName, this.lastName, this.panelSettings);

  FullName.fromPrefs(String name) {
    var splitName = name.split(' ');
    firstName = FirstName.fromPrefs(splitName.first);
    lastName = LastName.fromPrefs(splitName.last);
  }

  String getCombinedName() {
    return '${firstName.name.capitalize()} ${lastName.name.capitalize()}';
  }

  void rerollName() {
    // print(firstName.numSyllables);
    firstName.generate(panelSettings);
    lastName.generate(panelSettings);
  }
}
