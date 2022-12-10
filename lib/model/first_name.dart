part of model;

class FirstName extends Name {
  FirstName() {
    name = generate(Constants.NUM_STARTING_SYLLABLES);
    length = name.length;
  }
  FirstName.numSylls(int numSyllables) {
    name = generate(numSyllables);
    length = name.length;
  }
}
