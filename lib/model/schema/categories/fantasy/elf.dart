part of fantasy;

class Elf implements Subcategory {
  final String _name = 'Elf';

  @override
  IconData icon = FontAwesomeIcons.earListen;

  @override
  String toString() {
    return _name;
  }

  String generate() {
    return 'Legolas';
  }
}
