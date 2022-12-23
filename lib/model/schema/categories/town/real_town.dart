part of town;

class RealTown implements Subcategory {
  final String _name = 'Real Town';

  // @override
  // IconData icon = FontAwesomeIcons.building;

  @override
  AssetImage icon = const AssetImage('lib/assets/icons/png/skyscraper.png');

  @override
  String getName() {
    return _name;
  }

  @override
  String generate() {
    return 'Leland';
  }
}
