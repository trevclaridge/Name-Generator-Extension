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
                    return Consumer<App>(builder: (context, value, child) {
                      return NamePanel(
                        fullName: App().panelNames[index],
                        panelSettings: App().panelSettings[index],
                      );
                    });
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
