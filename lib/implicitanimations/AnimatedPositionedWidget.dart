import 'package:flutter/material.dart';

class AnimatedPositionedWidget extends StatefulWidget {
  const AnimatedPositionedWidget({super.key});

  @override
  State<AnimatedPositionedWidget> createState() =>
      _AnimatedPositionedWidgetState();
}

class _AnimatedPositionedWidgetState extends State<AnimatedPositionedWidget> {
  bool isMoved = false;

  void _togglePosition() {
    setState(() {
      isMoved = !isMoved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Positioned"),
      ),
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
                "AnimatedPositioned widget in Flutter is a widget that animates changes in the position of a child within a Stack.",
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
                height: 300,
                child: Stack(children: [
                  AnimatedPositioned(
                      duration: const Duration(seconds: 1),
                      left: isMoved ? 200 : 0,
                      top: isMoved ? 100.0 : 0.0,
                      child: GestureDetector(
                        onTap: _togglePosition,
                        child: Container(
                            width: 100,
                            height: 100,
                            color: Colors.red,
                            child: const Center(
                              child: Text(
                                'Tap Me',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ))
                ]),
              )


            ],
          ),
        )
      ),
    );
  }
}
