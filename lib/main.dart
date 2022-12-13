import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_names_extension/view/view.dart';
import 'package:random_names_extension/model/model.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main() {
  if (App().checkFirstOpen()) {
    App().initializeApp();
  }
  App().populateSavedNames();
  App().populatePanelSettings();
  runApp(
    ChangeNotifierProvider(
      create: (context) => App(),
      child: const MyApp(),
    ),
  );
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
        'names': (context) => const GeneratorPage(),
        'saved': (context) => const SavedPage(),
        'home': (context) => const HomePage()
      },
    );
  }
}
