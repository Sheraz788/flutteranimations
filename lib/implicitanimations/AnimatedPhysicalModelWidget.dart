import 'package:flutter/material.dart';
import 'package:flutter_animations/widgets/app_toolbar.dart';

class AnimatedPhysicalModelWidget extends StatefulWidget {
  const AnimatedPhysicalModelWidget({super.key});

  @override
  State<AnimatedPhysicalModelWidget> createState() =>
      _AnimatedPhysicalModelWidgetState();
}

class _AnimatedPhysicalModelWidgetState
    extends State<AnimatedPhysicalModelWidget> {
  bool _isToggled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppToolbar(title: 'AnimatedPhysicalModel'),
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
                "AnimatedPhysicalModel widget in Flutter allows you to animate changes to a physical model's properties, such as shape, elevation, color, and shadow color, over a given duration.",
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
                      _isToggled = !_isToggled;
                    });
                  },
                  child: Container(
                    width: 150.0,
                    height: 150.0,
                    child: AnimatedPhysicalModel(
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOut,
                      elevation: _isToggled ? 10.0 : 15.0,
                      shape: BoxShape.rectangle,
                      color: _isToggled ? Colors.blue : Colors.red,
                      shadowColor: _isToggled ? Colors.blue : Colors.red,
                      borderRadius: _isToggled
                          ? BorderRadius.circular(30.0)
                          : BorderRadius.circular(5.0),
                      child: Container(
                        height: 150.0,
                        width: 150.0,
                        child: Center(
                          child: Text(
                            'Tap me!',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
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
