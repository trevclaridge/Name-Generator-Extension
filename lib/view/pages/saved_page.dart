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
        return (App().savedNames.isEmpty)
            ? Center(
                child: Text(
                  'Your saved names will appear here.',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              )
            : ListView(
                children: [
                  const SizedBox(height: 10.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 26.0, vertical: 10.0),
                        child: Text('Your saved names:',
                            style: Theme.of(context).textTheme.labelMedium),
                      ),
                      ListView.builder(
                        reverse: true,
                        itemCount: App().savedNames.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: ((context, index) {
                          // auto scroll to bottom from: https://stackoverflow.com/questions/53483263/flutter-how-to-make-a-list-that-always-scrolls-to-the-bottom
                          final reversedIndex =
                              App().savedNames.length - 1 - index;
                          final element =
                              App().savedNames.elementAt(reversedIndex);
                          return SavedNamePanel(
                            savedName: element,
                          );
                        }),
                      ),
                    ],
                  ),
                ],
              );
      }),
    );
  }
}
