import 'package:flutter/material.dart';
import 'package:random_names_extension/bin/bin.dart';
import 'package:random_names_extension/view/view.dart';
import 'package:random_names_extension/model/model.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // separateSylls();
  // Map<String, Object> values = <String, Object>{
  //   'saved_names': ["Biryne Cargen", "Trevor Claridge"]
  // };
  // SharedPreferences.setMockInitialValues(values);

  App().populateSavedNames();
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
      initialRoute: 'home',
      routes: <String, WidgetBuilder>{
        'names': (context) => const NamesPage(),
        'saved': (context) => const SavedPage(),
        'home': (context) => const HomePage()
      },
    );
  }
}

void separateSylls() {
  var split = Syllables().captonCroutonSylls.split(' ');
  split = split.map((syl) => syl.toLowerCase()).toList();
}
