import 'package:flutter/material.dart';
import 'package:flutter_animations/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      home: HomeScreen()
    );
  }
}


class AnimationExample extends StatefulWidget {
  @override
  _AnimationExampleState createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    // Define an animation that uses easeIn for the first half and easeOut for the second half
    _animation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(2, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.0, 0.5,
        curve: Curves.linear, // easeIn for the first half
      ),
    ))..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SlideTransition(
        position: _animation,
        child: Container(
          width: 50,
          height: 50,
          color: Colors.blue,
        ),
      ),
    );
  }
}

