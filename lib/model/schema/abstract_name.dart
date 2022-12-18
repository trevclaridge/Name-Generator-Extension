part of model;

abstract class Name {
  String name;
  // int numSyllables;
  // Category category;
  // Gender gender;

  PanelSettings defaultSettings = PanelSettings(
      // panelNum: 0,
      numSyllables: 2,
      toggleCategory: Category.medieval,
      toggleGender: Gender.genderNeutral);

  Name({
    this.name = '',
    // this.numSyllables = 2,
    // this.category = Category.medieval,
    // this.gender = Gender.genderNeutral
  });

  String generate(PanelSettings settings);
}
