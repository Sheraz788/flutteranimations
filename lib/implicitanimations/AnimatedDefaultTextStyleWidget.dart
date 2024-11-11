import 'package:flutter/material.dart';
import 'package:flutter_animations/widgets/app_toolbar.dart';

class AnimatedDefaultTextStyleWidget extends StatefulWidget {
  const AnimatedDefaultTextStyleWidget({super.key});

  @override
  State<AnimatedDefaultTextStyleWidget> createState() => _AnimatedDefaultTextStyleWidgetState();

}

class _AnimatedDefaultTextStyleWidgetState extends State<AnimatedDefaultTextStyleWidget> {

  bool _isLarge = false;

  void _toggleTextStyle() {
    setState(() {
      _isLarge = !_isLarge;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppToolbar(title: 'AnimatedDefaultTextStyle'),
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
                "AnimatedDefaultTextStyle widget in Flutter allows you to animate changes to the text style of a Text widget, such as font size, color, or weight.",
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
                height: 10,
              ),

              Center(
                child: AnimatedDefaultTextStyle(
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  style: _isLarge
                      ? const TextStyle(
                    fontSize: 40,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  )
                      : const TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.normal,
                  ),
                  child: Text('Hello, TextStyle!'),
                ),
              ),
          
              SizedBox(height: 20),
          
              Center(
                child: ElevatedButton(
                  onPressed: _toggleTextStyle,
                  child: Text('Animate Text Style'),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
