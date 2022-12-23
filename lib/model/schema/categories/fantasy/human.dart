part of fantasy;

class Human implements Subcategory {
  final String _name = 'Human';

  // @override
  // IconData icon = FontAwesomeIcons.user;

  @override
  String icon = 'lib/assets/icons/svg/warrior.svg';

  @override
  String getName() {
    return _name;
  }

  @override
  String generate() {
    return 'Aragorn';
  }
}