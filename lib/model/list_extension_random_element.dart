part of model;

// https://stackoverflow.com/questions/17476718/how-do-get-a-random-element-from-a-list-in-dart
extension ListExtension<T> on List<T> {
  T getRandomElement() {
    return this[Random().nextInt(length)];
  }
}
