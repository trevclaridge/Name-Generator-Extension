part of model;

class SavedName {
  String name;
  Category category;
  Subcategory subcategory;
  Gender gender;
  DateTime date;

  SavedName(
      {required this.name,
      required this.category,
      required this.subcategory,
      required this.gender,
      required this.date});

  factory SavedName.fromPrefs(String prefNameJson) {
    var json = jsonDecode(prefNameJson);
    final dateFormat = DateFormat('yMd');

    Category savedCategory = Categories().parse(json['category']);
    Subcategory savedSubcategory = savedCategory.parse(json['subcategory']);

    return SavedName(
        name: json['name'],
        category: savedCategory,
        subcategory: savedSubcategory,
        gender: EnumToString.fromString(Gender.values, json['gender'])!,
        date: dateFormat.parse(json['date']));
  }

  String toJsonString() {
    final dateFormat = DateFormat('yMd');

    Map<String, dynamic> json = {
      'name': name,
      'category': category.getName(),
      'subcategory': subcategory.getName(),
      'gender': EnumToString.convertToString(gender),
      'date': dateFormat.format(date)
    };

    return jsonEncode(json);
  }
}
