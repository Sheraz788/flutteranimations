import 'package:flutter/material.dart';

class AnimatedCrossFadeWidget extends StatefulWidget {
  const AnimatedCrossFadeWidget({super.key});

  @override
  State<AnimatedCrossFadeWidget> createState() =>
      _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  bool _showFirst = false;

  void _toggleShowFirst() {
    setState(() {
      _showFirst = !_showFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Animated CrossFade"),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedCrossFade(
                          duration: const Duration(seconds: 1),
                          firstChild: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'First Widget',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                          ),
                          secondChild: Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      'Second Widget',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )),
                          crossFadeState:
                  _showFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                        ),

                ElevatedButton(
                  onPressed: _toggleShowFirst,
                  child: const Text('Start CrossFade'),
                ),
              ],
            )
        )
    );
  }
}
