part of chaos;

class BlipBlorp implements Subcategory {
  final String _name = 'Blip Blorp';

  @override
  String icon = 'assets/icons/svg/rings.svg';

  @override
  String getName() {
    return _name;
  }

  @override
  String generate(PanelSettings settings) {
    String firstName = '';
    String lastName = '';

    for (int i = 0; i < settings.numSyllables; ++i) {
      firstName += blipblorpSyllables.getRandomElement();
    }
    if (!firstName.endsWith('p') &&
        vowels.contains(firstName[firstName.length - 1])) {
      firstName += 'p';
    }

    for (int i = 0; i < settings.numSyllables + 1; ++i) {
      lastName += blipblorpSyllables.getRandomElement();
    }
    if (!lastName.endsWith('p') &&
        vowels.contains(lastName[lastName.length - 1])) {
      lastName += 'p';
    }
    return '${firstName.capitalize()} ${lastName.capitalize()}';
  }

  List<String> blipblorpSyllables = [
    'bli',
    'blo',
    'ob',
    'obo',
    'ibo',
    'ilb',
    'op',
    'ip',
    'orp',
    'bro',
    'blur',
    'pip',
    'blu',
    'pu',
    'lub',
    'pub',
    'por',
    'pur',
    'bur',
    'urb',
    'urp'
  ];

  List<String> vowels = ['a', 'e', 'i', 'o', 'u', 'y'];
}
