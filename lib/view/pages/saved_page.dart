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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: ListView.builder(
          itemCount: App().savedNames.length,
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            return NamePanel(
              fullName: App().savedNames.elementAt(index),
              isSavedPage: true,
            );
          }),
        ),
      ),
    );
  }
}
