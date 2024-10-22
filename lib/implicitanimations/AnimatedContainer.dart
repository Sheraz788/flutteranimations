import 'package:flutter/material.dart';

class AnimatedContainerAnim extends StatefulWidget {
  const AnimatedContainerAnim({super.key});

  @override
  State<AnimatedContainerAnim> createState() => _AnimatedContainerAnimState();
}

class _AnimatedContainerAnimState extends State<AnimatedContainerAnim> {
  bool isExpanded = false;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          width: isExpanded ? 300 : 100,
          height: isExpanded ? 300 : 100,
          color: isExpanded ? Colors.blue : Colors.black,
          curve: Curves.linearToEaseOut,
          child: GestureDetector(
            onTap: (){
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Center(child: Text("Tap me", style: TextStyle(color: isExpanded ? Colors.white : Colors.white),),),
          ),

        ),
      )
    );
  }
}
