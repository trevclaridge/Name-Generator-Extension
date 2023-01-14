part of town;

class FantasyTown implements Subcategory {
  final String _name = 'Fantasy Town';

  @override
  String icon = 'assets/icons/svg/windmill.svg';

  @override
  String getName() {
    return _name;
  }

  @override
  String generate(PanelSettings settings) {
    String fantasyTownName = '';

    for (int i = 0; i < settings.numSyllables; ++i) {
      fantasyTownName += Syllables().syllables.getRandomElement();
    }

    fantasyTownName += townSuffixes.getRandomElement();

    return fantasyTownName.capitalize();
  }

  List<String> townSuffixes = [
    'ville',
    'holme',
    'run',
    'ton',
    'ham',
    'moor',
    'fair',
    'eld',
    'bury',
    'field',
    'fields',
    'shire',
    'den',
    'stead',
    'dale',
    'wick'
  ];
}
