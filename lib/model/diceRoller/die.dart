part of model;

class Die {
  final int numSides;

  Die(this.numSides);

  int roll() {
    final random = Random();
    return random.nextInt(numSides) + 1;
  }
}
