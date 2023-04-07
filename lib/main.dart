import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:lucky13capstone/dev_page.dart';
import 'package:lucky13capstone/scan_page.dart';
=======
import 'package:provider/provider.dart'; // used to work with ChangeNotifiers, Consumers, and Producers to manage State
import 'package:lucky13capstone/history_page.dart'; // used to access the HistoryModel for updating the State of the Scan History
import 'package:lucky13capstone/classifier/lego_recognizer.dart';
import 'package:shared_preferences/shared_preferences.dart'; //used to save and restore settings when app is launched
import 'settings_model.dart';
import 'package:lucky13capstone/themes.dart';
import 'package:lucky13capstone/landing_page.dart';
>>>>>>> 828b9eb12b76c93b34acc302d7d8ae0b20eab4e6

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); //initialize firebase

  // Load Preferences
  Map<String, dynamic> preferences = await loadPreferences();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HistoryModel()),
        ChangeNotifierProvider(
          create: (context) => SettingsModel(preferences: preferences),
        ),
      ],
      child: const BrickFinder(),
    ),
  );
  // runApp(const BrickFinder());   // this is the original way we called this without Provider class
}

class BrickFinder extends StatelessWidget {
  const BrickFinder({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return AdaptiveTheme(
      light: ThemeData(
        scaffoldBackgroundColor: const Color(0xFfffffff),
        appBarTheme:
            const AppBarTheme(color: Color.fromARGB(255, 38, 214, 226)),
        listTileTheme: const ListTileThemeData(
            textColor: Color.fromARGB(255, 25, 39, 48),
            iconColor: Color.fromARGB(255, 25, 39, 48)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: const Color.fromARGB(
                223, 212, 89, 100), // background (button) color
            foregroundColor: const Color(0xFfffffff), // foreground (text) color
          ),
        ),
      ),
      dark: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 25, 39, 48),
        appBarTheme:
            const AppBarTheme(color: Color.fromARGB(223, 212, 89, 100)),
        listTileTheme: const ListTileThemeData(
            textColor: Color.fromARGB(255, 38, 214, 226),
            iconColor: Color.fromARGB(255, 38, 214, 226)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: const Color.fromARGB(
                255, 38, 214, 226), // background (button) color
            foregroundColor: const Color.fromARGB(
                255, 25, 39, 48), // foreground (text) color
          ),
        ),
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
          theme: theme, darkTheme: darkTheme, home: const DevPage(title: 'Dev Page')),
=======
    final settings = context.watch<SettingsModel>();

    // Choose the theme based on the darkMode setting
    final theme = settings.darkMode ? darkTheme : lightTheme;

    return MaterialApp(
      theme: theme,
      home: const LegoRecogniser(),
      //home: const LandingPage(),
>>>>>>> 828b9eb12b76c93b34acc302d7d8ae0b20eab4e6
    );
  }
}

Future<Map<String, dynamic>> loadPreferences() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  // Return the preferences in a map
  return {
    'darkMode': prefs.getBool('darkMode') ?? false,
    'language': prefs.getString('language') ?? 'en',
    'loggedIn': prefs.getBool('loggedIn') ?? false,
  };
}
