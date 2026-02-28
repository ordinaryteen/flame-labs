import 'package:flame_labs/features/m2-synth/data/notifiers.dart';
import 'package:flutter/material.dart';

class NavbarWidget extends StatelessWidget {
  NavbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBar(
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: "rumah"),
              NavigationDestination(icon: Icon(Icons.person), label: "profil"),
            ],
            onDestinationSelected: (int value) {
              selectedPageNotifier.value = value;
            },
            selectedIndex: selectedPage);
      },
    );
  }
}
