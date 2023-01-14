part of model;

// https://ra9r.medium.com/overcoming-the-limitations-of-dart-enum-8866df8a1c47

abstract class Subcategory {
  final String _name = 'Error: Subcategory name';

  String icon = 'assets/icons/svg/error.svg';

  String getName() {
    return _name;
  }

  String generate(PanelSettings settings);
}
