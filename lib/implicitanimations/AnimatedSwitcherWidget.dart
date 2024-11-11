import 'package:flutter/material.dart';
import 'package:flutter_animations/widgets/app_toolbar.dart';

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
    return Scaffold(
      appBar: AppToolbar(title: 'Animated Switcher'),
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
                "AnimatedSwitcher widget in Flutter is used to switch between two or more widgets with a transition animation.",
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
                child: AnimatedSwitcher(
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
              ),

              SizedBox(height: 20),

              Center(
                child: ElevatedButton(
                  onPressed: _toggleWidget,
                  child: Text('Toggle Widget'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
