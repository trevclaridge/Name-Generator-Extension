part of model;

class LastName extends Name {
  LastName() {
    name = generate(defaultSettings);
  }

  // LastName.numSylls(int numSyllables) {
  //   name = generate();
  // }

  LastName.fromPrefs(String namePrefs) {
    name = namePrefs;
  }

  @override
  String generate(PanelSettings settings) {
    var random = Random();

    for (int i = 0; i < settings.numSyllables; ++i) {
      name = name +
          Syllables().syllables[random.nextInt(Syllables().syllables.length)];
    }

    if (name.length > (settings.numSyllables * 3)) {
      name = '';
      name = generate(settings);
    }

    if (settings.toggleCategory == Category.dragon) {
      name = 'Paarthurnax';
    }

    return name;
  }
}
