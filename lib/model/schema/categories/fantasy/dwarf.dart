part of fantasy;

class Dwarf implements Subcategory {
  final String _name = 'Dwarf';

  // @override
  // IconData icon = FontAwesomeIcons.hammer;

  @override
  String icon = 'lib/assets/icons/svg/dwarf.svg';

  @override
  String getName() {
    return _name;
  }

  @override
  String generate(PanelSettings settings) {
    return '${getFirstName(settings).capitalize()} ${getLastName().capitalize()}';
  }

  String getFirstName(PanelSettings settings) {
    var random = Random();
    String firstName = '';

    for (var i = 0; i < settings.numSyllables - 1; ++i) {
      firstName += dwarfFirstStarts.getRandomElement();
    }
    if (settings.activeGender == Gender.masculine) {
      firstName += dwarfFirstMasculineEnds.getRandomElement();
    } else if (settings.activeGender == Gender.feminine) {
      firstName += dwarfFirstFeminineEnds.getRandomElement();
    } else {
      firstName = (random.nextBool())
          ? firstName += dwarfFirstMasculineEnds.getRandomElement()
          : firstName += dwarfFirstFeminineEnds.getRandomElement();
    }
    return firstName;
  }

  String getLastName() {
    String lastName = '';

    lastName += dwarfLastStarts.getRandomElement();
    lastName += dwarfLastEnds.getRandomElement();

    return lastName;
  }

  List<String> dwarfFirstStarts = [
    'adr',
    'alber',
    'ba',
    'bar',
    'gar',
    'kildr',
    'dies',
    'eld',
    'gurd',
    'har',
    'morg',
    'or',
    'rur',
    'mar',
    'vis',
    'jen',
    'torg',
    'tak',
    'thor',
    'end',
    'ris',
    'em',
    'gunn'
  ];

  List<String> dwarfFirstMasculineEnds = [
    'ik',
    'ich',
    'ern',
    'end',
    'tor',
    'nor',
    'in',
    'rak',
    'gen',
    'sik',
    'gran',
    'linn',
    'vok',
    'brek',
    'dal',
    'gar'
  ];

  List<String> dwarfFirstFeminineEnds = [
    'ber',
    'tin',
    'hild',
    'dryn',
    'a',
    'eth',
    'runn',
    'ellen',
    'loda',
    'dis',
    'ja',
    'lin',
    'ra',
    'tyrd',
    'de',
    'rasa'
  ];

  List<String> dwarfLastStarts = [
    'iron',
    'bronze',
    'golden',
    'gleaming',
    'platinum',
    'deep',
    'solid',
    'earthen',
    'angled',
    'brutal',
    'grim',
    'true',
    'raw',
    'blackened',
    'singed',
    'scorched',
    'heavy',
    'steel',
    'harsh',
    'gory',
    'bloody',
    'black',
    'green',
    'yellow',
    'red',
    'blue',
    'frost',
    'scorch',
    'singe',
    'earth',
    'brute',
    'east',
    'north',
    'south',
    'west',
    'gore',
    'copper',
    'silver',
    'tin',
    'white',
    'metal',
    'ferro',
    'ore',
    'pearl',
    'heat',
    'nickel',
    'dim',
    'shallow'
  ];

  List<String> dwarfLastEnds = [
    'helm',
    'axe',
    'pick',
    'hammer',
    'sides',
    'skull',
    'boots',
    'greaves',
    'grave',
    'belt',
    'gut',
    'rack',
    'stone',
    'arms',
    'shelf',
    'home',
    'spirit',
    'soul',
    'finger',
    'gloves',
    'caps',
    'throat',
    'eyes',
    'lance',
    'spear',
    'mace',
    'mine',
    'craft',
    'smelt',
    'chant',
    'rust',
    'smith',
    'maker',
    'mill',
    'forge',
    'carve',
    'blow',
    'rock',
    'quill',
    'needle',
    'mason',
    'step',
    'gate',
    'crest',
    'gate',
    'door',
    'cap',
    'eye',
    'greave',
    'side',
    'boot',
    'bottom'
  ];
}
