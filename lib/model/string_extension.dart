part of model;

// https://stackoverflow.com/questions/29628989/how-to-capitalize-the-first-letter-of-a-string-in-dart
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
