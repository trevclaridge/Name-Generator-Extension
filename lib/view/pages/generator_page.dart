part of view;

class GeneratorPage extends StatefulWidget {
  const GeneratorPage({Key? key}) : super(key: key);

  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: ListView(
        children: [
          const SizedBox(height: 10.0),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 26.0, vertical: 10.0),
                  child: Text(
                    'Let\'s generate some names!',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                ListView.builder(
                  addAutomaticKeepAlives: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: App().panelNames.length,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Consumer<App>(
                        builder: (context, value, child) {
                          return GeneratorPanel(
                            panelNum: index,
                            panelName: App().panelNames[index],
                            panelSettings:
                                App().panelNames[index].panelSettings,
                          );
                        },
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
