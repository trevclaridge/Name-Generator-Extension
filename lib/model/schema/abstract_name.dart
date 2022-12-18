part of model;

abstract class Name {
  String name;
  PanelSettings defaultSettings = PanelSettings(
    numSyllables: 2,
    toggleCategory: Category.medieval,
    toggleGender: Gender.genderNeutral,
  );

  Name({
    this.name = 'Error generating name.',
  });

  String generate(PanelSettings settings);
}
