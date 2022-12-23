part of pirate;

class Ship implements Subcategory {
  final String _name = 'Ship';

  // @override
  // IconData icon =
  //     const ImageIcon(AssetImage('lib/assets/pirate-ship.png')) as IconData;

  @override
  String icon = 'lib/assets/icons/svg/pirate_ship.svg';

  @override
  String getName() {
    return _name;
  }

  @override
  String generate() {
    return 'The Black Pearl';
  }
}
