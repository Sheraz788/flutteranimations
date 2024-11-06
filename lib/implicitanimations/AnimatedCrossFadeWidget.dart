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
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                  "AnimatedCrossFade widget in Flutter is a widget that cross-fades between two children widgets, animating changes in opacity and size to create a smooth transition between the two.",
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


                Center(
                  child: AnimatedCrossFade(
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
                ),
            
                Center(
                  child: ElevatedButton(
                    onPressed: _toggleShowFirst,
                    child: const Text('Start CrossFade'),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
