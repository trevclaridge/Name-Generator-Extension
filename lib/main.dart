import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_names_extension/view/view.dart';
import 'package:random_names_extension/model/model.dart';

void main() async {
  runApp(
      const Center(child: CircularProgressIndicator(color: Color(0xFFFF8C44))));

  // this variables exists only to ensure the async function completes before the evaluation below
  // ignore: unused_local_variable
  bool isFO = await App().checkFirstOpen();
  if (App().isFirstOpen) {
    App().initializeApp();
  } else {
    App().populateSavedNames();
    App().populatePanelSettings();
  }

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
      theme: CustomTheme.defaultTheme,
      initialRoute: 'home',
      routes: <String, WidgetBuilder>{
        'settings': (context) => const SettingsPage(),
        'home': (context) => const HomePage()
      },
    );
  }
}
