part of tavern;

class FantasyTavern implements Subcategory {
  final String _name = 'Fantasy Tavern';

  @override
  IconData icon = FontAwesomeIcons.glassWater;

  @override
  String toString() {
    return _name;
  }

  String generate() {
    return 'The Prancing Poney';
  }
}
