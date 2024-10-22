import 'package:flutter/material.dart';


class ExplicitAnimations extends StatefulWidget {
  const ExplicitAnimations({super.key});

  @override
  State<ExplicitAnimations> createState() => _ExplicitAnimationsState();
}

class _ExplicitAnimationsState extends State<ExplicitAnimations> with SingleTickerProviderStateMixin {
  //AnimationController
  //Animation
  //Tween
  //CurvedAnimation

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 300).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();

  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explicit Animations"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              height: _animation.value,
              width: _animation.value,
              color: Colors.blue,
            );
          },
        ),
      ),
    );
  }
}
