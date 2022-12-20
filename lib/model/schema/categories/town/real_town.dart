part of town;

class RealTown implements Subcategory {
  final String _name = 'Real Town';

  @override
  IconData icon = FontAwesomeIcons.building;

  @override
  String toString() {
    return _name;
  }

  String generate() {
    return 'Leland';
  }
}
