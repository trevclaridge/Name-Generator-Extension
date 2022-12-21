part of model;

abstract class Category {
  final String _name = 'Error: Category name';
  List<Subcategory> subcategories = [Sailor()];
  Subcategory activeSubcategory = Sailor();
  IconData icon = FontAwesomeIcons.x;

  @override
  Category(String subcategoryPref);

  String getName() {
    return _name;
  }

  List<Subcategory> getSubcategories() {
    return subcategories;
  }

  Subcategory parse(String subcategoryPref);
}
