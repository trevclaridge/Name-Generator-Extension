part of pirate;

class Sailor implements Subcategory {
  final String _name = 'Sailor';

  @override
  String icon = 'lib/assets/icons/svg/starfish_pirate.svg';

  @override
  String getName() {
    return _name;
  }

  @override
  String generate(PanelSettings settings) {
    String sailorName = '';
    sailorName += crewTitles.getRandomElement();
    sailorName += ' ';

    if (settings.activeGender == Gender.masculine) {
      sailorName += Names().masculine.getRandomElement().capitalize();
    } else if (settings.activeGender == Gender.feminine) {
      sailorName += Names().feminine.getRandomElement().capitalize();
    } else {
      if (Random().nextBool()) {
        sailorName += Names().masculine.getRandomElement().capitalize();
      } else {
        sailorName += Names().feminine.getRandomElement().capitalize();
      }
    }

    if (Random().nextInt(4) == 0) {
      sailorName +=
          ' "${ColorNames().colorNames.getRandomElement().capitalize()}" ';
    } else {
      sailorName += ' "${nicknames.getRandomElement()}" ';
    }
    sailorName += FinNLP().lastNames.getRandomElement().capitalize();

    return sailorName;
  }

  List<String> nicknames = [
    'Ace',
    'Hook',
    'Tops',
    'Whiz',
    'Wrecker',
    'Wreck',
    'Black-finger',
    'Finger',
    'Aces',
    'Hooks',
    'Whizzer',
    'Fingers',
    'Black-fingers',
    'Face',
    'Mask',
    'Saber',
    'Peg',
    'Barnacle',
    'Barnacles',
    'Crab',
    'Leech',
    'Goose',
    'Pigeon',
    'Crow',
    'Meek',
    'Mink',
    'Minx',
    'Pygmy',
    'Rat',
    'Beluga',
    'Shrew',
    'Bug',
    'Fin',
    'Gill',
    'Hunt',
    'Harpoon',
    'Anchor',
    'Sails',
    'Rogue',
  ];

  List<String> crewTitles = [
    'Captian',
    'Quartermaster',
    'First Mate',
    'Second Mate',
    'Third Mate',
    'Boatswain',
    'Bosun',
    'Cabin Boy',
    'Carpenter',
    'Gunner',
    'Master-at-Arms',
    'Navigator',
    'Helmsman',
    'Powder Monkey',
    'Striker',
    'Surgeon',
    'Deckhand',
    'Cooper',
    'Cook',
    'Officer',
    'Sailmaker',
    'Crewman',
    'Sailing Master',
    'Doctor',
    'Master Gunner',
    'Musician',
    'Fiddler',
    'Drummer',
    'Trumpeter',
    'Mage',
    'Helmsman',
    'Cannoneer',
    'Arcanist',
    'Spotter',
    'Pistoleer',
    'Musketeer',
    'Marksman',
    'Priest',
    'Druid',
    'Rigger',
    'Swab',
    'Coxswain',
    'Pilot'
  ];
}
