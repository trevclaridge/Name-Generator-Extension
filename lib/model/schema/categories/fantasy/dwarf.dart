part of fantasy;

class Dwarf implements Subcategory {
  final String _name = 'Dwarf';

  // @override
  // IconData icon = FontAwesomeIcons.hammer;

  @override
  String icon = 'lib/assets/icons/svg/dwarf.svg';

  @override
  String generate() {
    return 'Gimli';
  }

  @override
  String getName() {
    return _name;
  }
}
