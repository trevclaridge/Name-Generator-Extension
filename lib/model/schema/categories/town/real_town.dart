part of town;

class RealTown implements Subcategory {
  final String _name = 'Real Town';

  @override
  IconData icon = FontAwesomeIcons.building;

  @override
  String getName() {
    return _name;
  }

  @override
  String generate() {
    return 'Leland';
  }
}
