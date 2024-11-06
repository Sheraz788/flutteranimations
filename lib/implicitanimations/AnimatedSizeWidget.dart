import 'package:flutter/material.dart';

class AnimatedSizeWidget extends StatefulWidget {
  const AnimatedSizeWidget({super.key});

  @override
  State<AnimatedSizeWidget> createState() => _AnimatedSizeWidgetState();
}

class _AnimatedSizeWidgetState extends State<AnimatedSizeWidget> {

  bool _isExpanded = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedSize Example')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: AnimatedSize(
            duration: Duration(seconds: 2),
            curve: Curves.easeInOut,
            child: Container(
              width: _isExpanded ? 200.0 : 100.0,
              height: _isExpanded ? 200.0 : 100.0,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(
                'Tap me!',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
