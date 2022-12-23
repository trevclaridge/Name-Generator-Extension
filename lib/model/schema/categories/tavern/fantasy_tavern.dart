part of tavern;

class FantasyTavern implements Subcategory {
  final String _name = 'Fantasy Tavern';

  // @override
  // IconData icon = FontAwesomeIcons.glassWater;

  @override
  AssetImage icon = const AssetImage('lib/assets/icons/png/beer.png');

  @override
  String getName() {
    return _name;
  }

  @override
  String generate() {
    return 'The Prancing Pony';
  }
}
