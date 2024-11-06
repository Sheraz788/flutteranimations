import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('AnimatedSize Example')),
        body: Center(child: AnimatedSizeExample()),
      ),
    );
  }
}

class AnimatedSizeExample extends StatefulWidget {
  @override
  _AnimatedSizeExampleState createState() => _AnimatedSizeExampleState();
}

class _AnimatedSizeExampleState extends State<AnimatedSizeExample> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
