part of view;

class SavedPage extends StatefulWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Padding(
    //     padding: const EdgeInsets.symmetric(vertical: 20.0),
    //     child: (App().savedNames.isEmpty)
    //         ? const Center(
    //             child: Text('Your saved names will appear here'),
    //           )
    //         : ListView.builder(
    //             itemCount: App().savedNames.length,
    //             shrinkWrap: true,
    //             itemBuilder: ((context, index) {
    //               return SavedNamePanel(
    //                 fullName: App().savedNames.elementAt(index),
    //               );
    //             }),
    //           ),
    //   ),
    // );

    return Center(
      child: Scaffold(
          body: Counter(
        numSyllables: 2,
      )),
    );
  }
}
