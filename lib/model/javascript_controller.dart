part of model;

class JavascriptController {
  void changeIcon(String themeString) {
    js.context.callMethod('changeIcon', [themeString]);
  }

  // void setSyncPair(String key, String value) {
  //   js.context.callMethod('setSyncPair', [key, value]);
  // }

  // String getSyncValue(String key) {
  //   var value = js.context.callMethod('getSyncValue', [key]);
  //   // print(value);
  //   return value;
  // }
}
