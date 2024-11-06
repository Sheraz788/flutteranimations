import 'package:flutter/material.dart';

class AnimatedSwitcherWidget extends StatefulWidget {
  const AnimatedSwitcherWidget({super.key});

  @override
  State<AnimatedSwitcherWidget> createState() => _AnimatedSwitcherWidgetState();
}

class _AnimatedSwitcherWidgetState extends State<AnimatedSwitcherWidget> {

  bool _isFirstWidget = true;

  void _toggleWidget() {
    setState(() {
      _isFirstWidget = !_isFirstWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Animated Switcher'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: Duration(seconds: 1),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(1.0, 0.0),
                    end: Offset(0.0, 0.0),
                  ).animate(animation),
                  child: child,
                );
              },
              child: _isFirstWidget
                  ? Container(
                key: ValueKey(1),
                width: 200,
                height: 200,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'First Widget',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              )
                  : Container(
                key: ValueKey(2),
                width: 200,
                height: 200,
                color: Colors.orange,
                child: Center(
                  child: Text(
                    'Second Widget',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleWidget,
              child: Text('Toggle Widget'),
            ),
          ],
        ),
      ),
    );
  }
}
