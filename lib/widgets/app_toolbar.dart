import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppToolbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppToolbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            color: app_theme_color,
            boxShadow: [
              BoxShadow(
                color: app_theme_color.withOpacity(0.7),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: AppBar(
            title: Text(title, style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.transparent, // Set to transparent for the Container color to take effect
            elevation: 10,
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.white),
          ),
        )
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}
