part of pirate;

class Ship implements Subcategory {
  final String _name = 'Ship';

  @override
  IconData icon = FontAwesomeIcons.sailboat;

  @override
  String getName() {
    return _name;
  }

  @override
  String generate() {
    return 'The Black Pearl';
  }
}
