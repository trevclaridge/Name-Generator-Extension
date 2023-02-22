import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_names_extension/view/view.dart';
import 'package:random_names_extension/model/model.dart';

void main() async {
  // runApp(Center(
  //     child: CircularProgressIndicator(color: Theme.of(context).primaryColor)));

  WidgetsFlutterBinding.ensureInitialized();

  // this variables exists only to ensure the async
  // function completes before the evaluation below
  // ignore: unused_local_variable
  bool isFO = await App().checkFirstOpen();
  if (App().isFirstOpen) {
    App().initializeApp();
    UserSettings().saveUserSettingsToPrefs();
  } else {
    App().populateSavedNames();
    App().populatePanelSettings();
    UserSettings().populateUserSettings();
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => App()),
        ChangeNotifierProvider(create: (context) => UserSettings()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserSettings>(
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Name Generator Extension',
          theme: UserSettings().userTheme,
          initialRoute: 'home',
          routes: <String, WidgetBuilder>{
            'settings': (context) => const SettingsPage(),
            'home': (context) => const HomePage(),
          },
        );
      },
    );
  }
}
