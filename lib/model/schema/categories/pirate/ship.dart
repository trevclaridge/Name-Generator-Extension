part of pirate;

class Ship implements Subcategory {
  final String _name = 'Ship';

  @override
  String icon = 'assets/icons/svg/pirate_ship.svg';

  @override
  String getName() {
    return _name;
  }

  @override
  String generate(PanelSettings settings) {
    var random = Random();
    String shipName = '';

    if (random.nextInt(5) == 0) {
      shipName += Names().feminine.getRandomElement().capitalize();
      shipName += '\'s ';
      shipName += shipEnds.getRandomElement().capitalize();
    } else {
      shipName += 'The ';
      shipName += adjOrColor().capitalize();
      shipName += ' ';
      shipName += shipEnds.getRandomElement().capitalize();
    }
    return shipName;
  }

  String adjOrColor() {
    var random = Random();

    if (random.nextBool()) {
      return Adjectives().anthropomorphicAdjectives.getRandomElement();
    }
    return ColorNames().colorNames.getRandomElement();
  }

  List<String> shipEnds = [
    'pearl',
    'diamond',
    'jewel',
    'gem',
    'bone',
    'mollusk',
    'ruby',
    'barnacle',
    'revenge',
    'mermaid',
    'siren',
    'kraken',
    'crab',
    'shrimp',
    'dolphin',
    'leviathan',
    'goddess',
    'treasure',
    'skull',
    'damsel',
    'quest',
    'hunt',
    'clue',
    'harpy',
    'claw',
    'fin',
    'dragon',
    'coin',
    'glass',
    'ancient',
    'ruin',
    'sink',
    'pool',
    'whirlpool',
    'noble',
    'adventurer',
    'ghost',
    'origin',
    'silt',
    'heavens',
    'heaven',
    'hells',
    'hell',
    'trove',
    'archive',
    'deck',
    'swim',
    'purse',
    'explorer',
    'navigator',
    'sailor',
    'hero',
    'aristocrat',
    'warrior',
    'captain',
    'mate',
    'crewman',
    'prospector',
    'knight',
    'seaman',
    'ranger',
    'swashbuckler',
    'gambler',
    'mage',
    'locker',
    'bird',
    'hunter',
    'hermit',
    'poet',
    'crusader',
    'magician',
    'lover',
    'venturer',
    'capitalist',
    'lunatic',
    'mariner',
    'sleuth',
    'imp',
    'odyssey',
    'fear',
    'voyager',
    'frontier',
    'oarsman',
    'hazard',
    'risk',
    'trek',
    'trekker',
    'prospect',
    'crew',
    'sea',
    'range',
    'venture',
    'capital',
    'marine',
    'voyage',
    'awe',
    'crusade',
    'horror',
    'hatred',
    'threat',
    'charm',
    'rage',
    'obsession',
    'stranger',
    'nightmare',
    'spectre',
    'ghoul',
    'saint',
    'chill',
    'prize',
    'creep',
    'ghast',
    'chaos',
    'turn',
    'spider',
    'hurricane',
    'rain',
    'wind',
    'blizzard',
    'storm',
    'thunder',
    'tempest',
    'cloud',
    'clouds',
    'snow',
    'ice',
    'fire',
    'void',
    'fog',
    'death',
    'eye',
    'eyes',
    'shore',
    'harpie',
    'mana',
    'wave',
    'tide',
    'friend',
    'unfamiliar',
    'guest',
    'gentleman',
    'god',
    'merman',
    'dream',
    'sleep',
    'fever',
    'misery',
    'fiasco',
    'calamity',
    'haunt',
    'inferno',
    'veteran',
    'monster',
    'demon',
    'nexus',
    'moon',
    'catalyst',
    'joy',
    'siege',
    'elite',
    'evil',
    'bride',
    'agony',
    'mare',
    'stallion',
    'eclipse',
    'sun',
    'comet',
    'sky',
    'rune',
    'phantom',
    'soul',
    'shade',
    'shadow',
    'wraith',
    'specter',
    'psychic',
    'phantasm',
    'banshee',
    'entity',
    'blaze',
    'goblin',
    'man',
    'woman',
    'deity',
    'mirage',
    'love',
    'genie',
    'angler',
    'trout',
    'delver',
    'eel',
    'salmon',
    'tuna',
    'dragonfish',
    'unicornfish',
    'toadfish',
    'gemfish',
    'fishling',
    'feline',
    'canine',
    'prince',
    'princess',
    'queen',
    'king',
    'duke',
    'monarch',
    'duchess',
    'royal',
    'sovereign',
    'emperor',
    'countess',
    'diva',
    'throne',
    'crown',
    'dame',
    'maid',
    'future',
    'angel',
    'pixie',
    'journey',
    'atlas',
    'polaris',
    'grail',
    'titan',
    'behemoth',
    'traveler',
    'pilgrim',
    'wayfarer',
    'tour',
    'tourist',
    'whale',
    'swain',
    'colossus',
    'fathom',
    'fathomer',
    'menagerie',
    'element',
    'elemental',
    'elementalist',
    'contempt',
    'chariot',
    'chasm',
    'domain',
    'precipice',
    'oblivion',
    'anarchy',
    'anarchist',
    'mire',
    'brink',
    'depth',
    'depths',
    'raid',
    'vortex',
    'murk',
    'gloom',
    'transport',
    'sleigh',
    'carriage',
    'serpent',
    'devil',
    'trickster',
    'trick',
    'tyrant',
    'mystic',
    'prophet',
    'cultist',
    'occultist',
    'immortal',
    'shaman',
    'bastard',
    'secret',
    'oracle',
    'celestial',
    'seer',
    'rogue',
    'cleric',
    'mortal',
    'usurper',
    'swarm',
    'hive',
    'martyr',
    'imperialist',
    'barbarian',
    'wizard',
    'sorcerer',
    'warlock',
    'bard',
    'druid',
    'monk',
    'paladin',
    'artificer',
    'heretic',
    'guardian',
  ];
}
