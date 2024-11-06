import 'package:flutter/material.dart';

class AnimatedPaddingWidget extends StatefulWidget {
  const AnimatedPaddingWidget({super.key});

  @override
  State<AnimatedPaddingWidget> createState() => _AnimatedPaddingWidgetState();
}

class _AnimatedPaddingWidgetState extends State<AnimatedPaddingWidget> {
  double paddingValue1 = 10.0;
  double paddingValue2 = 20.0;
  double paddingValue3 = 30.0;

  void _togglePadding() {
    setState(() {
      paddingValue1 = paddingValue1 == 10.0 ? 50.0 : 10.0;
      paddingValue2 = paddingValue2 == 20.0 ? 60.0 : 20.0;
      paddingValue3 = paddingValue3 == 30.0 ? 70.0 : 30.0;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Padding"),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              AnimatedContainer(
                duration: Duration(seconds: 1),
                color: Colors.tealAccent,
                child: AnimatedPadding(
                  padding: EdgeInsets.all(paddingValue1),
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  child: Container(
                    color: Colors.red,
                    height: 100,
                    width: 100,
                    child: Center(
                      child: Text(
                        'Box 1',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),

              AnimatedContainer(
                duration: Duration(seconds: 1),
                color: Colors.teal,
                child: AnimatedPadding(
                  padding: EdgeInsets.all(paddingValue2),
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  child: Container(
                    color: Colors.green,
                    height: 100,
                    width: 100,
                    child: Center(
                      child: Text(
                        'Box 2',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),

              AnimatedContainer(
                duration: Duration(seconds: 1),
                color: Colors.orangeAccent,
                child: AnimatedPadding(
                  padding: EdgeInsets.all(paddingValue3),
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  child: Container(
                    color: Colors.blue,
                    height: 100,
                    width: 100,
                    child: Center(
                      child: Text(
                        'Box 3',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          )
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: _togglePadding, label: Text('Click to Animate')),
    );
  }

}
