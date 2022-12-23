part of fantasy;

class Elf implements Subcategory {
  final String _name = 'Elf';

  // @override
  // IconData icon = FontAwesomeIcons.earListen;

  @override
  String icon = 'lib/assets/icons/svg/elf.svg';

  @override
  String getName() {
    return _name;
  }

  @override
  String generate() {
    return 'Legolas';
  }
}
