import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'tag1',
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: Image.asset(
          'assets/images/pinterest.avif',
        ),
      ),
    );
  }
}
