part of view;

class GeneratorPage extends StatefulWidget {
  const GeneratorPage({Key? key}) : super(key: key);

  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  List<FirstName> firstNames =
      List<FirstName>.generate(5, (counter) => FirstName());
  List<LastName> lastNames =
      List<LastName>.generate(5, (counter) => LastName());
  int numSyllables = Constants.NUM_STARTING_SYLLABLES;

  @override
  Widget build(BuildContext context) {
    List<FullName> fullNames = List<FullName>.generate(
      5,
      ((index) => FullName(
            firstNames.elementAt(index),
            lastNames.elementAt(index),
          )),
    );

    return Scaffold(
      appBar: null,
      body: ListView(
        children: [
          const SizedBox(height: 20.0),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return NamePanel(
                      fullName: fullNames.elementAt(index),
                      isSavedPage: false,
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: newNames,
        child: const Icon(Icons.refresh),
      ),
    );
  }

  void newNames() {
    setState(
      () {
        firstNames = List<FirstName>.generate(
            5, (counter) => FirstName.numSylls(numSyllables));
        lastNames = List<LastName>.generate(
            5, (counter) => LastName.numSylls(numSyllables));
      },
    );
  }
}
