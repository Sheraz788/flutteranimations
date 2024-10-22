import 'package:flutter/material.dart';

import 'explicitanimations/ExplicitAnimations.dart';
import 'implicitanimations/ImplicitAnimations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _leftButtonController;
  late AnimationController _rightButtonController;
  late Animation<Offset> _leftButtonAnimation;
  late Animation<Offset> _rightButtonAnimation;

  @override
  void initState() {
    super.initState();

    _leftButtonController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _rightButtonController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _leftButtonAnimation = Tween<Offset>(
      begin: Offset(-1.5, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _leftButtonController,
        curve: Curves.easeOut,
      ),
    );

    _rightButtonAnimation =
        Tween<Offset>(begin: Offset(1.5, 0), end: Offset.zero).animate(
            CurvedAnimation(
                parent: _rightButtonController, curve: Curves.easeOut));

    _leftButtonController.forward();
    _rightButtonController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _leftButtonController.dispose();
    _rightButtonController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Animations"),
        elevation: 5.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
                position: _leftButtonAnimation,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImplicitAnimations()));
                    },
                    child: Text("Implicit Animations"))),

            SizedBox(height: 20),

            SlideTransition(
                position: _rightButtonAnimation,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExplicitAnimations()));
                    },
                    child: Text("Explicit Animations"))),
          ],
        ),
      ),
    );
  }
}
