import 'package:flutter/material.dart';

class AnimatedPositionedWidget extends StatefulWidget {
  const AnimatedPositionedWidget({super.key});

  @override
  State<AnimatedPositionedWidget> createState() =>
      _AnimatedPositionedWidgetState();
}

class _AnimatedPositionedWidgetState extends State<AnimatedPositionedWidget> {
  bool isMoved = false;

  void _togglePosition() {
    setState(() {
      isMoved = !isMoved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Positioned"),
      ),
      body: Center(
          child: Stack(children: [
        AnimatedPositioned(
            duration: const Duration(seconds: 1),
            left: isMoved ? 200 : 0,
            top: isMoved ? 100.0 : 0.0,
            child: GestureDetector(
              onTap: _togglePosition,
              child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      'Tap Me',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ))
      ])),
    );
  }
}
