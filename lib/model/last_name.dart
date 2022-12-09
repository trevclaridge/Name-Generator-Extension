part of model;

class LastName extends Name {
  LastName() {
    name = generate(3);
    length = name.length;
  }

  LastName.numSylls(int numSyllables) {
    name = generate(numSyllables);
    length = name.length;
  }
}
