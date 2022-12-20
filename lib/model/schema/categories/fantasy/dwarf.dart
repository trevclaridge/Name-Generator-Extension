part of fantasy;

class Dwarf implements Subcategory {
  final String _name = 'Dwarf';

  @override
  IconData icon = FontAwesomeIcons.hammer;

  @override
  String toString() {
    return _name;
  }

  String generate() {
    return 'Gimli';
  }
}
