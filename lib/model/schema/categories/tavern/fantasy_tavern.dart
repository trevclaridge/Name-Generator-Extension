part of tavern;

class FantasyTavern implements Subcategory {
  final String _name = 'Fantasy Tavern';

  // @override
  // IconData icon = FontAwesomeIcons.glassWater;

  @override
  String icon = 'lib/assets/icons/svg/beer.svg';

  @override
  String getName() {
    return _name;
  }

  @override
  String generate() {
    return 'The Prancing Pony';
  }
}
