part of model;

class Name {
  String name = 'Error generating name.';
  PanelSettings panelSettings = PanelSettings(
    numSyllables: 2,
    toggleCategory: Category.fantasy,
    toggleSubcategories: defaultSubCategories,
    toggleGender: Gender.genderNeutral,
  );

  String getName() {
    return name;
  }

  void generate(PanelSettings settings) {
    switch (settings.toggleCategory) {
      case Category.town:
        {
          name = getTownName(settings.toggleSubcategories[0]);
        }
        break;
      case Category.pirate:
        {
          name = getPirateName(settings.toggleSubcategories[1]);
        }
        break;
      case Category.fantasy:
        {
          name = getFantasyName(settings.toggleSubcategories[2]);
        }
        break;
      case Category.tavern:
        {
          name = getTavernName(settings.toggleSubcategories[3]);
        }
        break;
      case Category.chaos:
        {
          name = getChaosName(settings.toggleSubcategories[4]);
        }
        break;
    }
    // if (numSyllables(name) != settings.numSyllables) {
    //   name = '';
    //   generate(settings);
    // }
    // print('Name: ' + name + '   Syllables: ' + numSyllables(name).toString());
  }

  int numSyllables(String tempString) {
    int count = 0;
    List<String> vowels = ['a', 'e', 'i', 'o', 'u', 'y'];

    if (vowels.contains(tempString[0])) {
      count += 1;
    }
    for (var i = 0; i < tempString.length; ++i) {
      if ((vowels.contains(tempString[i])) &&
          (!vowels.contains(tempString[i - 1]))) {
        count += 1;
      }
    }
    if (tempString[tempString.length - 1] == 'e') {
      count -= 1;
    }
    if ((tempString[tempString.length - 1] == 'e') &&
        (tempString[tempString.length - 2] == 'l') &&
        (vowels.contains(tempString[tempString.length - 3]))) {
      count += 1;
    }
    if (count == 0) {
      count + 1;
    }
    return count;
  }

  String getModernName() {
    String firstName;
    String lastName;

    var random = Random();

    if (panelSettings.toggleGender == Gender.feminine) {
      firstName = Names().feminine[random.nextInt(Names().feminine.length)];
    } else if (panelSettings.toggleGender == Gender.masculine) {
      firstName = Names().masculine[random.nextInt(Names().masculine.length)];
    } else {
      if (random.nextBool()) {
        firstName = Names().feminine[random.nextInt(Names().feminine.length)];
      } else {
        firstName = Names().masculine[random.nextInt(Names().masculine.length)];
      }
    }
    lastName = FinNLP().lastNames[random.nextInt(FinNLP().lastNames.length)];

    return '${firstName.capitalize()} ${lastName.capitalize()}';
  }

  String getTownName(Subcategory subcategory) {
    String name = 'Error generating town name';
    switch (subcategory) {
      case Town.real:
        name = RealTown().generate();
        break;
    }
    return name;
  }

  String getPirateName(Subcategory subcategory) {
    String name = 'Error generating pirate name';
    switch (subcategory) {
      case Pirate.sailor:
        name = Sailor().generate();
        break;
      case Pirate.ship:
        name = Ship().generate();
        break;
    }
    return name;
  }

  String getFantasyName(Subcategory subcategory) {
    String name = 'Error generating fantasy name';
    switch (subcategory) {
      case Fantasy.elf:
        name = Elf().generate();
        break;
      case Fantasy.dwarf:
        name = Dwarf().generate();
        break;
      case Fantasy.human:
        name = Human().generate();
        break;
    }
    return name;
  }

  String getTavernName(Subcategory subcategory) {
    String name = 'Error generating tavern name';
    switch (subcategory) {
      case Tavern.fantasy:
        name = FantasyTavern().generate();
        break;
    }
    return name;
  }

  String getChaosName(Subcategory subcategory) {
    String name = 'Error generating chaos name';
    switch (subcategory) {
      case Chaos.blipblorp:
        name = BlipBlorp().generate();
        break;
    }
    return name;
  }
}

List<Subcategory> defaultSubCategories = [
  Fantasy.human,
  Chaos.blipblorp,
  Town.real,
  Pirate.sailor,
  Tavern.fantasy
];
