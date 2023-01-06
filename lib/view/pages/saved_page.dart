part of view;

class SavedPage extends StatefulWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<App>(builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: (App().savedNames.isEmpty)
              ? const Center(
                  child: Text(
                    'Your saved names will appear here.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              : ListView.builder(
                  reverse: true,
                  itemCount: App().savedNames.length,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    // auto scroll to bottom from: https://stackoverflow.com/questions/53483263/flutter-how-to-make-a-list-that-always-scrolls-to-the-bottom
                    final reversedIndex = App().savedNames.length - 1 - index;
                    final element = App().savedNames.elementAt(reversedIndex);
                    return SavedNamePanel(
                      savedName: element,
                    );
                  }),
                ),
        );
      }),
    );
  }
}
