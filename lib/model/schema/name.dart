part of model;

class Name {
  String name = 'Error generating name.';
  PanelSettings panelSettings = PanelSettings(
    numSyllables: 2,
    activeCategoryIndex: 0,
    activeGender: Gender.genderNeutral,
    categories: Categories().categories,
  );

  String getName() {
    return name;
  }

  void generate(PanelSettings settings) {
    name = settings
        .categories[settings.activeCategoryIndex]
        .subcategories[
            settings.categories[settings.activeCategoryIndex].activeSubcategory]
        .generate();
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
}
