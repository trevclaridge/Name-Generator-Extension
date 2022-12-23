part of chaos;

class BlipBlorp implements Subcategory {
  final String _name = 'Blip Blorp';

  @override
  String icon = 'lib/assets/icons/svg/rings.svg';

  @override
  String generate() {
    return 'Blipblopbloop';
  }

  @override
  String getName() {
    return _name;
  }
}
