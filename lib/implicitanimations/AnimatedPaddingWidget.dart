import 'package:flutter/material.dart';
import 'package:flutter_animations/widgets/app_toolbar.dart';

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
      appBar: AppToolbar(title: "Animated Padding"),
      body: SingleChildScrollView(

        child: Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
        
                const Text(
                  "Definition : ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
        
                SizedBox(
                  height: 10,
                ),
        
                const Text(
                  "AnimatedPadding widget in Flutter is a widget that animates changes in its padding over a specified duration.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
        
                SizedBox(
                  height: 10,
                ),
        
                const Text(
                  "Code Snippet : ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
        
                SizedBox(
                  height: 10,
                ),

                InteractiveViewer(
                  panEnabled: true,
                  scaleEnabled: true,
                  minScale: 1,
                  maxScale: 5,
                  child: const Image(
                      image: AssetImage(
                          "assets/codesnippets/animated_opacity.png")),
                ),

                SizedBox(
                  height: 10,
                ),

                const Text(
                  "Animation View : ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),

                SizedBox(
                  height: 10,
                ),
        
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                  ),
                )
              ],
            )
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: _togglePadding, label: Text('Click to Animate')),
    );
  }

}
