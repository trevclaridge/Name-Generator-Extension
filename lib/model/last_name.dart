part of model;

class LastName extends Name {
  LastName() {
    name = generate(Constants.NUM_STARTING_SYLLABLES);
    length = name.length;
  }

  LastName.numSylls(int numSyllables) {
    name = generate(numSyllables);
    length = name.length;
  }
}
