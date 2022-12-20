part of fantasy;

class Human implements Subcategory {
  final String _name = 'Human';

  @override
  IconData icon = FontAwesomeIcons.user;

  @override
  String toString() {
    return _name;
  }

  String generate() {
    return 'Aragorn';
  }
}
