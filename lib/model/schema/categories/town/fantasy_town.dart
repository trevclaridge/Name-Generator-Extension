part of town;

class FantasyTown implements Subcategory {
  final String _name = 'FantasyTown';

  @override
  IconData icon = FontAwesomeIcons.wizardsOfTheCoast;

  @override
  String getName() {
    return _name;
  }

  @override
  String generate() {
    return 'Whiterun';
  }
}
