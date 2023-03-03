part of model;

class JavascriptController {
  void changeIcon(String themeString) {
    js.context.callMethod('changeIcon', [themeString]);
  }
}
