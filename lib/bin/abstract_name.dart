part of bin;

abstract class Name {
  String name;
  int length;
  int numSyllables = 3;

  Name({
    this.length = 0,
    this.name = '',
  });

  String getName() {
    return name;
  }

  int getLength() {
    return name.length;
  }
}
