import 'package:flutter/material.dart';
import 'package:flutter_animations/widgets/app_toolbar.dart';

import '../theme/app_colors.dart';

class BasicHeroAnimation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppToolbar(title: "Basic Hero Animation"),

      body: Center(
        child: Hero(
          tag: 'hero-tag-0',
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.easeOut,
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: app_theme_color,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: const Text(
              "Basic Animation",
              style: TextStyle(
                  color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
