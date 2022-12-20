part of pirate;

class Ship implements Subcategory {
  final String _name = 'Ship';

  @override
  IconData icon = FontAwesomeIcons.sailboat;

  @override
  String toString() {
    return _name;
  }

  String generate() {
    return 'The Black Pearl';
  }
}
