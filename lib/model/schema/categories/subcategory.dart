part of model;

// https://ra9r.medium.com/overcoming-the-limitations-of-dart-enum-8866df8a1c47

abstract class Subcategory {
  String _name = 'Error: Subcategory name';
  IconData icon = FontAwesomeIcons.e;

  @override
  String toString() {
    return _name;
  }

  @override
  String generate();
}
