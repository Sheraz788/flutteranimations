import 'package:flutter/material.dart';

class MultiAnimatedContainerInAlign extends StatefulWidget {
  @override
  _MultiAnimatedContainerInAlignState createState() => _MultiAnimatedContainerInAlignState();
}

class _MultiAnimatedContainerInAlignState extends State<MultiAnimatedContainerInAlign> {
  Alignment _alignment = Alignment.topLeft; // Alignment for AnimatedAlign
  bool _changeContainers = false; // To toggle container properties

  void _changeAlignmentAndContainers() {
    setState(() {
      // Toggle alignment for AnimatedAlign
      _alignment = _alignment == Alignment.topLeft ? Alignment.bottomRight : Alignment.topLeft;
      // Toggle container size and color
      _changeContainers = !_changeContainers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedAlign with Multiple Containers')),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              height: 400,
              width: 400,
              color: Colors.blue[50],
              child: AnimatedAlign(
                alignment: _alignment,
                duration: Duration(seconds: 2),
                curve: Curves.easeInOut,
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Adjust row size to content
                  children: [
                    // First AnimatedContainer
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: _changeContainers ? 50 : 100,
                      height: _changeContainers ? 50 : 100,
                      color: _changeContainers ? Colors.red : Colors.blue,
                      child: Center(
                        child: Text(
                          '1',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    // Second AnimatedContainer
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: _changeContainers ? 50 : 100,
                      height: _changeContainers ? 50 : 100,
                      color: _changeContainers ? Colors.green : Colors.orange,
                      child: Center(
                        child: Text(
                          '2',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    // Third AnimatedContainer
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: _changeContainers ? 50 : 100,
                      height: _changeContainers ? 50 : 100,
                      color: _changeContainers ? Colors.purple : Colors.yellow,
                      child: Center(
                        child: Text(
                          '3',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: ElevatedButton(
                onPressed: _changeAlignmentAndContainers,
                child: Text('Animate'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

