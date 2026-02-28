import 'package:flame_labs/archive/features/m2-synth/data/constants.dart';
import 'package:flutter/material.dart';

class TestingPage extends StatelessWidget {
  const TestingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ratio = 0.6;
    double widthScreen = MediaQuery.of(context).size.width * ratio;
    double heightScreen = MediaQuery.of(context).size.height * ratio;
    return Scaffold(
      body: Center(child: Box(widthScreen, heightScreen)),
    );
  }

  Container Box(double widthScreen, double heightScreen) {
    return Container(
      width: widthScreen,
      height: heightScreen,
      decoration: BoxDecoration(
        color: const Color.fromARGB(221, 103, 212, 234),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: heightScreen * 0.6 * 0.2,
            decoration: BoxDecoration(
              color: const Color.fromARGB(221, 255, 13, 0),
            ),
            child: Text(
              "i miss everything",
              style: KTextStyle.descriptionText,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.amber,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: const Color.fromARGB(255, 36, 255, 7),
            ),
          ),
        ],
      ),
    );
  }
}
