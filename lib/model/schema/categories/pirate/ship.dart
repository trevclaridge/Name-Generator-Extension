part of pirate;

class Ship implements Subcategory {
  final String _name = 'Ship';

  // @override
  // IconData icon =
  //     const ImageIcon(AssetImage('lib/assets/pirate-ship.png')) as IconData;

  @override
  AssetImage icon = const AssetImage('lib/assets/icons/png/pirate-ship.png');

  @override
  String getName() {
    return _name;
  }

  @override
  String generate() {
    return 'The Black Pearl';
  }
}
