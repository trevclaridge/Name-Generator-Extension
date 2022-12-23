part of pirate;

class Sailor implements Subcategory {
  final String _name = 'Sailor';

  // @override
  // IconData icon = FontAwesomeIcons.anchor;

  @override
  AssetImage icon =
      const AssetImage('lib/assets/icons/png/starfish_pirate.png');

  @override
  String getName() {
    return _name;
  }

  @override
  String generate() {
    return 'Captain Jack Sparrow';
  }
}
