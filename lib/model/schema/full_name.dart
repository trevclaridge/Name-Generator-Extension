part of model;

class FullName {
  late FirstName firstName;
  late LastName lastName;

  FullName(this.firstName, this.lastName);

  FullName.fromPrefs(String name) {
    var splitName = name.split(' ');
    firstName = FirstName.fromPrefs(splitName.first);
    lastName = LastName.fromPrefs(splitName.last);
  }

  String getCombinedName() {
    return '${firstName.name.capitalize()} ${lastName.name.capitalize()}';
  }

  void rerollName(int numSyllables) {
    firstName.generate(numSyllables);
    lastName.generate(numSyllables);
  }
}
