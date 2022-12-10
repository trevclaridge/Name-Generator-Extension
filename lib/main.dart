import 'package:flutter/material.dart';
import 'package:random_names_extension/bin/bin.dart';
import 'package:random_names_extension/view/view.dart';

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
      initialRoute: 'names',
      routes: <String, WidgetBuilder>{
        'names': (context) => const NamesPage(),
        'saved': (context) => const SavedPage(),
      },
    );
  }
}

void separateSylls() {
  var split = Syllables().captonCroutonSylls.split(' ');
  split = split.map((syl) => syl.toLowerCase()).toList();
}
