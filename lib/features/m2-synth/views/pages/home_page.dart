import 'package:flame_labs/features/m2-synth/data/constants.dart';
import 'package:flame_labs/features/m2-synth/views/widgets/hero_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            HeroWidget(),
            Divider(),
            Expanded(
              child: Lottie.asset(
                'assets/lotties/congrats.json',
                fit: BoxFit.contain,
              ),
            ),
            Container(
              child: Text(
                "Perguruan Joko Kendil",
                style: KTextStyle.titleText,
              ),
            ),
            Container(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "kereta kencan",
                        style: KTextStyle.titleText,
                      ),
                      Text("kereta kencan"),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
