part of fantasy;

class Elf implements Subcategory {
  final String _name = 'Elf';

  @override
  String icon = 'lib/assets/icons/svg/elf.svg';

  @override
  String getName() {
    return _name;
  }

  @override
  String generate(PanelSettings settings) {
    return '${getFirstName(settings).capitalize()} ${getLastName(settings).capitalize()}${getTitle()}';
  }

  String getFirstName(PanelSettings settings) {
    var random = Random();
    String firstName = '';

    for (int i = 0; i < settings.numSyllables - 1; ++i) {
      firstName += elfStarts[random.nextInt(elfStarts.length - 1)];
    }

    if (settings.activeGender == Gender.masculine) {
      firstName +=
          elfMasculineEnds[random.nextInt(elfMasculineEnds.length - 1)];
    } else if (settings.activeGender == Gender.feminine) {
      firstName += elfFeminineEnds[random.nextInt(elfFeminineEnds.length - 1)];
    } else {
      firstName = (random.nextBool())
          ? firstName +=
              elfMasculineEnds[random.nextInt(elfMasculineEnds.length - 1)]
          : firstName +=
              elfFeminineEnds[random.nextInt(elfFeminineEnds.length - 1)];
    }

    return firstName;
  }

  String getLastName(PanelSettings settings) {
    var random = Random();
    String lastName = '';

    for (int i = 0; i < settings.numSyllables; ++i) {
      int path = 0;
      path = random.nextInt(3);
      if (path == 0) {
        lastName += elfMasculineEnds[random.nextInt(elfMasculineEnds.length)];
      } else if (path == 1) {
        lastName += elfMasculineEnds[random.nextInt(elfMasculineEnds.length)];
      } else {
        lastName += elfStarts[random.nextInt(elfStarts.length)];
      }
    }

    return lastName;
  }

  String getTitle() {
    var random = Random();
    String title = '';

    title += ' of the ';
    title += adjectives[random.nextInt(adjectives.length)].capitalize();
    title += ' ';

    if (random.nextBool()) {
      title += natureWords[random.nextInt(natureWords.length)].capitalize();
    } else {
      title += PluralRules()
          .convertToPluralNoun(natureWords[random.nextInt(natureWords.length)])
          .capitalize();
    }

    return title;
  }

  List<String> elfStarts = [
    'ad',
    'all',
    'aram',
    'berri',
    'car',
    'enial',
    'gann',
    'im',
    'per',
    'sorvi',
    'var',
    'adr',
    'an',
    'beth',
    'bir',
    'jelen',
    'key',
    'lesh',
    'mer',
    'mia',
    'naiv',
    'quel',
    'sar',
    'shan'
  ];

  List<String> elfMasculineEnds = [
    'an',
    'ar',
    'il',
    'rian',
    'ric',
    'is',
    'dan',
    'arai',
    'meral',
    'cian',
    'en',
    'rion',
    'ialis',
    'ior',
    'nan',
    'kas'
  ];

  List<String> elfFeminineEnds = [
    'rie',
    'aea',
    'striana',
    'inua',
    'rynna',
    'ilia',
    'na',
    'neth',
    'leth',
    'iel',
    'lee',
    'qui',
    'astra',
    'ia',
    'ania',
    'ynn'
  ];

  List<String> natureWords = [
    'leaf',
    'plant',
    'rock',
    'frond',
    'evergreen',
    'green',
    'tree',
    'root',
    'bark',
    'moss',
    'twig',
    'petal',
    'flower',
    'branch',
    'fig',
    'seed',
    'lily',
    'maple',
    'kindle',
    'tulip',
    'bud',
    'bloom',
    'vine',
    'berry',
    'fruit',
    'yellow',
    'red',
    'stalk',
    'mulch',
    'silk',
    'sky',
    'river',
    'stream',
    'lake',
    'brook',
    'dirt',
    'lichen',
    'orange',
    'shadow',
    'beam',
    'light',
    'mist',
    'rain',
    'brush',
    'bug',
    'moon',
    'star',
    'comet',
    'stone',
    'cut',
    'fungus',
    'shoot',
    'clover',
    'sheet',
    'rose',
    'sapling',
    'willow',
    'conifer',
    'cloverleaf',
    'sunflower',
    'cherry',
    'orchid',
    'daisy',
    'feather',
    'tulip',
    'hibiscus',
    'bouquet',
    'herb',
    'lotus',
    'pink',
    'season',
    'flush',
    'peak',
    'veg',
    'peony',
    'marigold',
    'cactus',
    'flora',
    'arctic',
    'sun',
    'petunia',
    'overgrowth',
    'wild'
  ];

  List<String> adjectives = [
    'gleaming',
    'rotten',
    'shining',
    'glistening',
    'glowing',
    'glittering',
    'glimmering',
    'sparkling',
    'shimmering',
    'twinkling',
    'resplendent',
    'lustrous',
    'magnificent',
    'shiny',
    'bright',
    'gilded',
    'luminous',
    'glassy',
    'glaring',
    'radiant',
    'majestic',
    'flickering',
    'ornate',
    'adorning',
    'dazzling',
    'towering',
    'opulent',
    'grimy',
    'lacquered',
    'marbled',
    'speckled',
    'smirking',
    'neon',
    'nestled',
    'silken',
    'silver',
    'silvering',
    'dulled',
    'sorrowed',
    'baleful',
    'sorrowing',
    'dulling',
    'nestling',
    'towered',
    'flickered',
    'adorned',
    'glass',
    'glassed',
    'shined',
    'glowed',
    'rotting',
    'brightening',
    'anguishing',
    'anguished',
    'pitied',
    'pitying',
    'tragic',
    'distressing',
    'mourning',
    'distressed',
    'mourned',
    'suffering',
    'suffered',
    'repenting',
    'repented',
    'praying',
    'prayed',
    'bereaved',
    'weeping',
    'haunting',
    'haunted',
    'wailing',
    'wailed',
    'lonely',
    'grieving',
    'pained',
    'saintly',
    'pious',
    'tender',
    'wistful',
    'fairy',
    'fair',
    'solemned',
    'solemning',
    'sighing',
    'moving',
    'travelling',
    'travelled',
    'sobbing',
    'moaning',
    'heartbreaking',
    'heartbroken',
    'tearful',
    'happy',
    'content',
    'glad',
    'fortunate',
    'good',
    'sad',
    'grateful',
    'healthy',
    'blessed',
    'blissful',
    'pleasant',
    'ecstatic',
    'willing',
    'willed',
    'laughing',
    'prosperous',
    'confident',
    'laughed',
    'fulfilled',
    'jealous',
    'golden',
    'bittersweet',
    'resentful',
    'greedy',
    'vengeful',
    'overjealous',
    'envious',
    'romancing',
    'romanced',
    'hating',
    'worried',
    'shallowing',
    'shallowed',
    'bellowing',
    'bellowed',
    'heating',
    'heated'
  ];
}
