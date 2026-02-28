import 'package:flutter/material.dart';
import '../widgets/widget_tree.dart';
import '../widgets/hero_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeroWidget(),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return WidgetTree(title: "ikaa");
                      },
                    ),
                  );
                },
                child: Text('Login say'))
          ],
        ),
      ),
    );
  }
}
