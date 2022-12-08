import 'package:flutter/material.dart';
import 'package:random_names_extension/bin/bin.dart';
import 'package:flutter/services.dart';

void main() {
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
  FirstName firstName = FirstName();
  LastName lastName = LastName();
  int numSyllables = 3;

  @override
  Widget build(BuildContext context) {
    String fullName =
        '${firstName.name.capitalize()} ${lastName.name.capitalize()}';
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: SelectableText(fullName,
                        style: Theme.of(context).textTheme.displayMedium),
                  ),
                  IconButton(
                    onPressed: () async {
                      await Clipboard.setData(ClipboardData(text: fullName));
                    },
                    icon: const Icon(Icons.copy),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80.0),
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
                      newName();
                    });
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: newName,
        child: const Icon(Icons.refresh),
      ),
    );
  }

  void newName() {
    setState(() {
      firstName.generate(numSyllables);
      lastName.generate(numSyllables);
    });
  }
}
