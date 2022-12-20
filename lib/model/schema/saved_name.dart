part of model;

class SavedName {
  String name = 'Error getting saved name';
  SavedName({this.name = ''});
  SavedName.fromPrefs(String prefName) {
    name = prefName;
  }
}
