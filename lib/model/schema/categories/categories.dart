part of model;

class Categories {
  List<Category> categories = [
    Fantasy(1),
    Pirate(0),
    Tavern(0),
    Town(0),
    Chaos(0),
  ];

  Category parse(String category) {
    Category categoryForReturn = Fantasy(1);

    for (var item in categories) {
      if (category == item.getName()) {
        categoryForReturn = item;
      }
    }

    return categoryForReturn;
  }

  List<String> nonGenderedSubcategories = [
    Ship().getName(),
    FantasyTavern().getName(),
    RealTown().getName(),
    FantasyTown().getName(),
    BlipBlorp().getName()
  ];

  List<String> syllabledSubcategories = [
    BlipBlorp().getName(),
    Elf().getName(),
    Dwarf().getName(),
    FantasyTown().getName()
  ];
}
