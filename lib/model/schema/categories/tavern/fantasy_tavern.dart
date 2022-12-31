part of tavern;

class FantasyTavern implements Subcategory {
  final String _name = 'Fantasy Tavern';

  @override
  String icon = 'lib/assets/icons/svg/saloon.svg';

  @override
  String getName() {
    return _name;
  }

  @override
  String generate(PanelSettings settings) {
    var random = Random();
    String tavernName = 'The';

    int temp = random.nextInt(3);

    if (temp == 2) {
      tavernName += ' ';
      tavernName += adjOrColor().capitalize();
      tavernName += ' ';
      tavernName += tavernNouns.getRandomElement().capitalize();
    } else if (temp == 1) {
      tavernName += ' ';
      tavernName += tavernNouns.getRandomElement().capitalize();
      tavernName += ' and ';
      tavernName += tavernNouns.getRandomElement().capitalize();
    } else {
      tavernName += ' ';
      tavernName += adjOrColor().capitalize();
      tavernName += ' and ';
      tavernName += adjOrColor().capitalize();
      if (random.nextInt(4) % 3 == 0) {
        tavernName += ' ';
        tavernName += tavernNouns.getRandomElement().capitalize();
      }
    }

    if (random.nextInt(10) == 1) {
      tavernName += ' ';
      tavernName += tavernSuffixes.getRandomElement().capitalize();
    }

    if (tavernName.length > 30) {
      tavernName = generate(settings);
    }

    return tavernName;
  }

  String adjOrColor() {
    var random = Random();

    if (random.nextBool()) {
      return Adjectives().adjectives.getRandomElement();
    }
    return ColorNames().colorNames.getRandomElement();
  }

  List<String> tavernNouns = [
    'pony',
    'dog',
    'tap',
    'keg',
    'flagon',
    'dragon',
    'spigot',
    'soul',
    'curd',
    'drink',
    'meat',
    'meal',
    'apple',
    'dinner',
    'liquid',
    'fluid',
    'cream',
    'vapor',
    'solid',
    'solids',
    'liquids',
    'mixture',
    'sauce',
    'broth',
    'bottle',
    'juice',
    'juices',
    'slurry',
    'smoke',
    'beer',
    'whiskey',
    'gin',
    'wine',
    'ale',
    'lager',
    'liquor',
    'malt',
    'brew',
    'suds',
    'booze',
    'barrel',
    'cask',
    'pint',
    'flask',
    'bottles',
    'jug',
    'drunk',
    'gallon',
    'whey',
    'swill',
    'stove',
    'grill',
    'cook',
    'roast',
    'griddle',
    'steak',
    'kitchen',
    'dish',
    'elf',
    'dwarf',
    'sprite',
    'fairy',
    'unicorn',
    'mermaid',
    'sphinx',
    'griffin',
    'troll',
    'yeti',
    'ghoul',
    'gnome',
    'imp',
    'pixie',
    'golem',
    'gremlin',
    'faerie',
    'orc',
    'ork',
    'robot',
    'grain',
    'corn',
    'flour',
    'barley',
    'grains',
    'rice',
    'maize',
    'rye',
    'treant',
    'nymph'
  ];

  List<String> tavernSuffixes = [
    'inn',
    'rest',
    'tavern',
    'lodge',
    'pub',
    'bar',
    'home',
    'hearth',
    'hut',
    'shack',
    'hermitage',
    'camp',
    'guild',
    'saloon',
    'winery',
    'lounge',
    'cafe',
    'gardens',
    'teahouse',
  ];
}
