part of model;

class FirstName extends Name {
  FirstName() {
    name = generate(defaultSettings);
  }

  FirstName.numSylls(int numSyllables) {
    name = generate(defaultSettings);
  }

  FirstName.fromPrefs(String namePrefs) {
    name = namePrefs;
  }

  @override
  String generate(PanelSettings settings) {
    var random = Random();

    // print(numSyllables);

    for (int i = 0; i < settings.numSyllables; ++i) {
      name = name +
          Syllables().syllables[random.nextInt(Syllables().syllables.length)];
    }

    if (name.length > (settings.numSyllables * 3)) {
      name = '';
      name = generate(settings);
    }
    return name;
  }
}
