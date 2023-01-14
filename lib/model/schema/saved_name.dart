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

    Category savedCategory = Categories().parse(json['category']);
    Subcategory savedSubcategory = savedCategory.parse(json['subcategory']);

    return SavedName(
        name: json['name'],
        category: savedCategory,
        subcategory: savedSubcategory,
        gender: EnumToString.fromString(Gender.values, json['gender'])!,
        date: Constants.DATE_FORMAT.parse(json['date']));
  }

  String toJsonString() {
    Map<String, dynamic> json = {
      'name': name,
      'category': category.getName(),
      'subcategory': subcategory.getName(),
      'gender': EnumToString.convertToString(gender),
      'date': Constants.DATE_FORMAT.format(date)
    };

    return jsonEncode(json);
  }
}
