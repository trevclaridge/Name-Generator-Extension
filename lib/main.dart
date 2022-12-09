import 'package:flutter/material.dart';
import 'package:random_names_extension/model/model.dart';
import 'package:flutter/services.dart';
import 'package:random_names_extension/bin/bin.dart';

void main() {
  // separateSylls();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Names',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Random Names'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<FirstName> firstNames =
      List<FirstName>.generate(5, (counter) => FirstName());
  List<LastName> lastNames =
      List<LastName>.generate(5, (counter) => LastName());
  int numSyllables = 2;

  @override
  Widget build(BuildContext context) {
    List<String> fullNames = List<String>.generate(
      5,
      ((index) =>
          '${firstNames.elementAt(index).name.capitalize()} ${lastNames.elementAt(index).name.capitalize()}'),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                        setState(() {
                          numSyllables = value.toInt();
                        });
                      },
                      onChangeEnd: (double value) {
                        setState(() {
                          newNames();
                        });
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
    setState(() {
      firstNames = List<FirstName>.generate(
          5, (counter) => FirstName.numSylls(numSyllables));
      lastNames = List<LastName>.generate(
          5, (counter) => LastName.numSylls(numSyllables));
    });
  }
}

class NamePanel extends StatefulWidget {
  const NamePanel({
    Key? key,
    required this.fullNames,
    required this.index,
  }) : super(key: key);

  final List<String> fullNames;
  final int index;

  @override
  State<NamePanel> createState() => _NamePanelState();
}

class _NamePanelState extends State<NamePanel> {
  Color namePanelColor = Colors.transparent;
  Color saveColor = const Color(0xFFC7CACC);
  Color copyColor = const Color(0xFFC7CACC);
  bool iconsVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: SizedBox(
        height: 90,
        child: MouseRegion(
          onEnter: (event) {
            setState(() {
              namePanelColor = const Color(0xffF6F6F6);
              iconsVisible = true;
            });
          },
          onHover: (event) {
            setState(() {
              namePanelColor = const Color(0xffF6F6F6);
            });
          },
          onExit: (event) {
            setState(() {
              namePanelColor = Colors.transparent;
              iconsVisible = false;
            });
          },
          child: Container(
            color: namePanelColor,
            child: Column(
              children: [
                const SizedBox(height: 5.0),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: SelectableText(
                      widget.fullNames.elementAt(widget.index),
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontSize: 36.0)),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: iconsVisible,
                      child: MouseRegion(
                        onEnter: (event) {
                          setState(() {
                            copyColor = Colors.black;
                          });
                        },
                        onExit: (event) {
                          setState(() {
                            copyColor = const Color(0xFFC7CACC);
                          });
                        },
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () async {
                            await Clipboard.setData(ClipboardData(
                                text:
                                    widget.fullNames.elementAt(widget.index)));
                          },
                          child: Icon(
                            Icons.copy,
                            color: copyColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Visibility(
                      visible: iconsVisible,
                      child: MouseRegion(
                        onEnter: (event) {
                          setState(() {
                            saveColor = Colors.black;
                          });
                        },
                        onExit: (event) {
                          setState(() {
                            saveColor = const Color(0xFFC7CACC);
                          });
                        },
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.save,
                            color: saveColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void separateSylls() {
  var split = Syllables().captonCroutonSylls.split(' ');
  split = split.map((syl) => syl.toLowerCase()).toList();
}
