part of model;

class FirstName extends Name {
  FirstName() {
    name = generate(3);
    length = name.length;
  }
  FirstName.numSylls(int numSyllables) {
    name = generate(numSyllables);
    length = name.length;
  }
}
