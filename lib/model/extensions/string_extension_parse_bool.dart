part of model;

extension BoolParsing on String {
  bool parseBool() {
    return toLowerCase() == 'true';
  }
}
