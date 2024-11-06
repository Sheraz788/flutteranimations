import 'package:flutter/material.dart';

class AnimatedPhysicalModelWidget extends StatefulWidget {
  const AnimatedPhysicalModelWidget({super.key});

  @override
  State<AnimatedPhysicalModelWidget> createState() => _AnimatedPhysicalModelWidgetState();
}

class _AnimatedPhysicalModelWidgetState extends State<AnimatedPhysicalModelWidget> {

  bool _isToggled = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedPhysicalModel'),
    ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isToggled = !_isToggled;
            });
          },
          child: Container(
            width: 150.0,
            height: 150.0,
            child: AnimatedPhysicalModel(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              elevation: _isToggled ? 10.0 : 15.0,
              shape: BoxShape.rectangle,
              color: _isToggled ? Colors.blue : Colors.red,
              shadowColor: _isToggled ? Colors.blue : Colors.red,
              borderRadius: _isToggled
                  ? BorderRadius.circular(30.0)
                  : BorderRadius.circular(5.0),
              child: Container(
                height: 150.0,
                width: 150.0,
                child: Center(
                  child: Text(
                    'Tap me!',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),


    );
  }
}
