part of chaos;

class BlipBlorp implements Subcategory {
  final String _name = 'Blip Blorp';

  @override
  IconData icon = FontAwesomeIcons.shuffle;

  @override
  String generate() {
    return 'Blipblopbloop';
  }

  @override
  String getName() {
    return _name;
  }
}
