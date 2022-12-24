part of fantasy;

class Human implements Subcategory {
  final String _name = 'Human';

  @override
  String icon = 'lib/assets/icons/svg/warrior.svg';

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

    String lastName =
        FinNLP().lastNames[random.nextInt(FinNLP().lastNames.length - 1)];
    return '$firstName $lastName';
  }

  String getFeminineName() {
    var random = Random();
    return Names().feminine[random.nextInt(Names().feminine.length - 1)];
  }

  String getMasculineName() {
    var random = Random();
    return Names().masculine[random.nextInt(Names().masculine.length - 1)];
  }
}
