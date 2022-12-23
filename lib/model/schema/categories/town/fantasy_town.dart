part of town;

class FantasyTown implements Subcategory {
  final String _name = 'FantasyTown';

  // @override
  // IconData icon = FontAwesomeIcons.wizardsOfTheCoast;

  @override
  AssetImage icon = const AssetImage('lib/assets/icons/png/windmill.png');

  @override
  String getName() {
    return _name;
  }

  @override
  String generate() {
    return 'Whiterun';
  }
}
