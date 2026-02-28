import 'package:flame_labs/archive/features/m2-synth/data/constants.dart';
import 'package:flame_labs/archive/features/m2-synth/data/notifiers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'views/pages/welcome_page.dart';

void main() {
  // runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: GrammarDrillLayout()));
  // runApp(const NatakosApp());
  runApp(myPagesApp());
}

class myPagesApp extends StatefulWidget {
  myPagesApp({Key? key}) : super(key: key);

  @override
  _myPagesAppState createState() => _myPagesAppState();
}

class _myPagesAppState extends State<myPagesApp> {
  @override
  void initState() {
    initThemeMode();
    super.initState();
  }

  void initThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? repeat = prefs.getBool(KConstants.themeModeKey);
    isDarkModeNotifier.value = repeat ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                  brightness: isDarkMode ? Brightness.dark : Brightness.light,
                  seedColor: const Color.fromARGB(221, 41, 102, 127)),
              useMaterial3: true,
              navigationBarTheme: NavigationBarThemeData(
                  indicatorColor: Colors.lightBlue,
                  backgroundColor: Colors.blue.withAlpha(10)),
            ),
            home: WelcomePage());
      },
    );
  }
}

/*

import 'drills/grammar_drill_layout.dart';

class MyCoolApp extends StatelessWidget {
  const MyCoolApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) 
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                brightness: Brightness.light, seedColor: Colors.greenAccent)),
        home: const GrammarDrillLayout());
}
*/

class NatakosApp extends StatelessWidget {
  const NatakosApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                brightness: Brightness.dark, seedColor: Colors.greenAccent)),
        home: const MainPage());
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mbak Ika",
          style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
        ),
        leading: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: const Color.fromARGB(255, 255, 255, 255),
          weight: 12,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("daj"),
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
          selectedIndex: 1,
          onDestinationSelected: (value) => print("Halooo"),
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
          ]),
    );
  }
}

/* 
void main() {
  runApp(const NatakosApp());
}


*/
