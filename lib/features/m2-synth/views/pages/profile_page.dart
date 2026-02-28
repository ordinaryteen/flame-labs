import 'package:flame_labs/features/m2-synth/data/notifiers.dart';
import 'package:flame_labs/features/m2-synth/views/pages/welcome_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          title: Text('MALES'),
          onTap: () {
            selectedPageNotifier.value = 0;
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return WelcomePage();
              },
            ));
          },
        ),
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: Duration(seconds: 3),
                behavior: SnackBarBehavior.floating,
                content: Text('DJOI'),
              ),
            );
          },
          child: Text(
            "istri gweh cntik bet",
            style: TextStyle(color: Colors.blueAccent, fontSize: 16.0),
          ),
        )
      ],
    );
  }
}
