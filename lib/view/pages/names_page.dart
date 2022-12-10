part of view;

class NamesPage extends StatefulWidget {
  const NamesPage({Key? key}) : super(key: key);

  @override
  State<NamesPage> createState() => _NamesPageState();
}

class _NamesPageState extends State<NamesPage> {
  List<FirstName> firstNames =
      List<FirstName>.generate(5, (counter) => FirstName());
  List<LastName> lastNames =
      List<LastName>.generate(5, (counter) => LastName());
  int numSyllables = Constants.NUM_STARTING_SYLLABLES;

  @override
  Widget build(BuildContext context) {
    List<String> fullNames = List<String>.generate(
      5,
      ((index) =>
          '${firstNames.elementAt(index).name.capitalize()} ${lastNames.elementAt(index).name.capitalize()}'),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Names'),
      ),
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
                    return NamePanel(fullNames: fullNames, index: index);
                  }),
                ),
                const SizedBox(height: 60.0),
                Text('Number of Syllables: $numSyllables',
                    style: Theme.of(context).textTheme.labelLarge),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Slider(
                    value: numSyllables.toDouble(),
                    min: 1,
                    max: 7,
                    divisions: 6,
                    label: numSyllables.round().toString(),
                    onChanged: (double value) {
                      setState(
                        () {
                          numSyllables = value.toInt();
                        },
                      );
                    },
                    onChangeEnd: (double value) {
                      setState(
                        () {
                          newNames();
                        },
                      );
                    },
                  ),
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
