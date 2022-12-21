part of pirate;

class Sailor implements Subcategory {
  final String _name = 'Sailor';

  @override
  IconData icon = FontAwesomeIcons.anchor;

  @override
  String getName() {
    return _name;
  }

  @override
  String generate() {
    return 'Captain Jack Sparrow';
  }
}
