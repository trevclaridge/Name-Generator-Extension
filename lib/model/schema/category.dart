part of model;

abstract class Category {
  String _name = 'Error: Category name';
  List<Subcategory> subcategories = [Sailor()];
  Subcategory activeSubcategory = Sailor();
  IconData icon = FontAwesomeIcons.x;

  @override
  Category(String subcategoryPref);

  @override
  String toString() {
    return _name;
  }

  @override
  List<Subcategory> getSubcategories() {
    return subcategories;
  }

  @override
  Subcategory parse(String subcategoryPref);
}
