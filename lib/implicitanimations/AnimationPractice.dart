import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  // Variables to track the state of the container's properties
  double _width = 200.0;
  double _height = 200.0;
  Color _color = Colors.blue;
  Alignment _alignment = Alignment.center;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      _changeContainer();

    });

  }


  void _changeContainer() {
    setState(() {
      // Change width and height
      _width = _width == 200.0 ? 300.0 : 200.0;
      _height = _height == 200.0 ? 300.0 : 200.0;

      // Change color
      _color = _color == Colors.blue ? Colors.red : Colors.blue;

      // Change alignment
      _alignment = _alignment == Alignment.center
          ? Alignment.bottomRight
          : Alignment.center;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedContainer Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              width: _width,
              height: _height,
              alignment: _alignment,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut, // Smooth curve for the animation
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                'Animated Container',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeContainer,
              child: Text('Animate Container'),
            ),
          ],
        ),
      ),
    );
  }
}
