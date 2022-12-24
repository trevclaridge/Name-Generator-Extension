part of pirate;

class Sailor implements Subcategory {
  final String _name = 'Sailor';

  // @override
  // IconData icon = FontAwesomeIcons.anchor;

  @override
  String icon = 'lib/assets/icons/svg/starfish_pirate.svg';

  @override
  String getName() {
    return _name;
  }

  @override
  String generate(PanelSettings settings) {
    return 'Captain Jack Sparrow';
  }
}
