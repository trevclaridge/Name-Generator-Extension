part of fantasy;

class Elf implements Subcategory {
  final String _name = 'Elf';

  // @override
  // IconData icon = FontAwesomeIcons.earListen;

  @override
  AssetImage icon = const AssetImage('lib/assets/icons/png/elf.png');

  @override
  String getName() {
    return _name;
  }

  @override
  String generate() {
    return 'Legolas';
  }
}
