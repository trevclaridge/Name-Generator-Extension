part of bin;

class FirstName extends Name {
  FirstName() {
    name = generate(3);
    length = name.length;
  }

  List syllables = [
    'ab',
    'bor',
    'cin',
    'dan',
    'er',
    'fin',
    'gal',
    'hill',
    'il',
    'jak',
    'kahn',
    'lon',
    'moor',
    'nas',
    'og',
    'pak',
    'quil',
    'ros',
    'son',
    'trey',
    'ur',
    'vin',
    'wok',
    'xor',
    'yon',
    'zod'
  ];

  String generate(int numSyllables) {
    var random = Random();

    for (int i = 0; i < numSyllables; ++i) {
      name = name + syllables[random.nextInt(syllables.length)];
    }

    if (name.length > (numSyllables * 3)) {
      name = '';
      name = generate(numSyllables);
    }
    return name;
  }
}
