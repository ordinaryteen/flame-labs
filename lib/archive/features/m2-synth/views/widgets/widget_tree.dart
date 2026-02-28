import 'package:flame_labs/archive/features/m2-synth/data/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/home_page.dart';
import '../pages/profile_page.dart';
import '../pages/setting_page.dart';
import 'navbar_widget.dart';
import '../../data/notifiers.dart';

List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  final String title;
  const WidgetTree({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                isDarkModeNotifier.value = !isDarkModeNotifier.value;
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                await prefs.setBool(
                    KConstants.themeModeKey, isDarkModeNotifier.value);
              },
              icon: ValueListenableBuilder(
                valueListenable: isDarkModeNotifier,
                builder: (context, isDarkMode, child) {
                  return Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode);
                },
              )),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SettingPage(title: "nikmati sementara yang ada");
                  },
                ));
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages[selectedPage];
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
