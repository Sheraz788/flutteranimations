import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;

  const AppElevatedButton({super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: app_theme_color,
              elevation: 5,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )

          ),
          onPressed: onPress,
          child: Text(title, style: TextStyle(color: Colors.white, fontSize: 16),)),
    );
  }
}
