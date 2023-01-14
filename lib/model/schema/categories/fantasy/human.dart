part of fantasy;

class Human implements Subcategory {
  final String _name = 'Human';

  @override
  String icon = 'assets/icons/svg/warrior.svg';

  @override
  String getName() {
    return _name;
  }

  @override
  String generate(PanelSettings settings) {
    var random = Random();
    String firstName;

    if (settings.activeGender == Gender.feminine) {
      firstName = getFeminineName();
    } else if (settings.activeGender == Gender.masculine) {
      firstName = getMasculineName();
    } else {
      firstName = (random.nextBool()) ? getFeminineName() : getMasculineName();
    }

    String lastName = FinNLP().lastNames.getRandomElement();
    return '$firstName $lastName';
  }

  String getFeminineName() {
    return Names().feminine.getRandomElement();
  }

  String getMasculineName() {
    return Names().masculine.getRandomElement();
  }
}
