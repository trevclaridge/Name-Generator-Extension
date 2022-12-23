part of chaos;

class BlipBlorp implements Subcategory {
  final String _name = 'Blip Blorp';

  @override
  AssetImage icon = const AssetImage('lib/assets/icons/png/rings.png');

  @override
  String generate() {
    return 'Blipblopbloop';
  }

  @override
  String getName() {
    return _name;
  }
}
