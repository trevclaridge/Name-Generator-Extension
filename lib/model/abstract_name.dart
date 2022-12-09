part of model;

abstract class Name {
  String name;
  int length;
  int numSyllables = 3;

  Name({
    this.length = 0,
    this.name = '',
  });

  String getName() {
    return name;
  }

  int getLength() {
    return name.length;
  }

  String generate(int numSyllables) {
    var random = Random();

    for (int i = 0; i < numSyllables; ++i) {
      name = name +
          Syllables().syllables[random.nextInt(Syllables().syllables.length)];
    }

    if (name.length > (numSyllables * 3)) {
      name = '';
      name = generate(numSyllables);
    }
    return name;
  }
}
