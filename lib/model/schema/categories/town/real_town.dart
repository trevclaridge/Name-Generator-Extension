part of town;

class RealTown implements Subcategory {
  final String _name = 'Real Town';

  @override
  String icon = 'assets/icons/svg/skyscraper.svg';

  @override
  String getName() {
    return _name;
  }

  @override
  String generate(PanelSettings settings) {
    return Names().places.getRandomElement();
  }
}
