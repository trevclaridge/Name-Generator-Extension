part of model;

class Categories {
  List<Category> categories = [
    Fantasy(1),
    Pirate(0),
    Tavern(0),
    Town(0),
    Chaos(0),
  ];

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
