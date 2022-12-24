part of town;

class FantasyTown implements Subcategory {
  final String _name = 'Fantasy Town';

  // @override
  // IconData icon = FontAwesomeIcons.wizardsOfTheCoast;

  @override
  String icon = 'lib/assets/icons/svg/windmill.svg';

  @override
  String getName() {
    return _name;
  }

  @override
  String generate(PanelSettings settings) {
    return 'Whiterun';
  }
}
