part of model;

abstract class Category {
  final String _name = 'Error: Category name';
  late List<Subcategory> subcategories;
  int activeSubcategory = 0;
  IconData icon = FontAwesomeIcons.x;

  @override
  Category(int subcategoryPref);

  String getName() {
    return _name;
  }

  List<Subcategory> getSubcategories() {
    return subcategories;
  }

  Subcategory parse(String subcategoryPref);
}
