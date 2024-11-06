import 'package:flutter/material.dart';

class AnimatedDefaultTextStyleWidget extends StatefulWidget {
  const AnimatedDefaultTextStyleWidget({super.key});

  @override
  State<AnimatedDefaultTextStyleWidget> createState() => _AnimatedDefaultTextStyleWidgetState();

}

class _AnimatedDefaultTextStyleWidgetState extends State<AnimatedDefaultTextStyleWidget> {

  bool _isLarge = false;

  void _toggleTextStyle() {
    setState(() {
      _isLarge = !_isLarge;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedDefaultTextStyle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            AnimatedDefaultTextStyle(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              style: _isLarge
                  ? TextStyle(
                fontSize: 40,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              )
                  : TextStyle(
                fontSize: 20,
                color: Colors.red,
                fontWeight: FontWeight.normal,
              ),
              child: Text('Hello, TextStyle!'),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: _toggleTextStyle,
              child: Text('Animate Text Style'),
            ),
          ],
        ),
      ),
    );
  }
}
