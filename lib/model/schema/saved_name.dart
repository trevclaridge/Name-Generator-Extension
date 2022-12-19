part of model;

class SavedName {
  late String name;
  SavedName({this.name = ''});
  SavedName.fromPrefs(String prefName) {
    name = prefName;
  }
}
