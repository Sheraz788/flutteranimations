import 'package:flutter/material.dart';
import 'package:flutter_animations/widgets/app_toolbar.dart';

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
      appBar: AppToolbar(title: 'AnimatedSize Example'),

      body: SingleChildScrollView(

        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                "AnimatedSize widget in Flutter animates changes to its size when its child widget’s size changes.",
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

              const SizedBox(
                height: 20,
              ),


              Center(
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
            ],
          ),
        ),
      ),
    );
  }
}
