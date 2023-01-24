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
      body: Consumer<App>(
        builder: (context, value, child) {
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
                          itemCount: App().savedNames.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: ((context, index) {
                            return SavedNamePanel(
                              savedName: App().savedNames.elementAt(index),
                            );
                          }),
                        ),
                      ],
                    ),
                  ],
                );
        },
      ),
    );
  }
}
