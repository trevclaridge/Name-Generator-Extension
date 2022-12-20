part of pirate;

class Sailor implements Subcategory {
  final String _name = 'Sailor';

  @override
  IconData icon = FontAwesomeIcons.anchor;

  @override
  String toString() {
    return _name;
  }

  String generate() {
    return 'Captain Jack Sparrow';
  }
}
